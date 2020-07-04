defmodule JaTranslationsWeb.Router do
  use JaTranslationsWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :admin_layout do
    plug :put_layout, {JaTranslationsWeb.LayoutView, :admin}
  end

  pipeline :auth do
    plug JaTranslations.Accounts.Pipeline
  end

  pipeline :ensure_auth do
    plug Guardian.Plug.EnsureAuthenticated
  end

  pipeline :api do
    plug :accepts, ["json"]
    scope "/api", JaTranslations.Api, as: :api do
      get "/game-transcripts/:id", GameTranscriptController, :show
      get "/game-transcripts/title/:title", GameTranscriptController, :by_title
      get "/scenes/:id", GameTranscriptController, :scenes
    end
  end

  scope "/", JaTranslationsWeb do
    pipe_through [:browser, :auth]

    get "/", PageController, :index
    get "/game-transcripts", GameTranscriptController, :index
    get "/game-transcripts/:id", GameTranscriptController, :show
  end

  scope "/admin", JaTranslationsWeb.Admin, as: :admin do
    pipe_through [:browser, :admin_layout, :auth]

    get "/login", SessionController, :new
    post "/login", SessionController, :login
    get "/logout", SessionController, :logout
  end

   scope "/admin", JaTranslationsWeb.Admin, as: :admin do
    pipe_through [:browser, :admin_layout, :auth, :ensure_auth]

    get "/", PageController, :index
    resources "/game-transcripts", GameTranscriptsController do
      resources "/chapters", ChapterController
    end
    resources "/scenes", SceneController
    resources "/game-characters", GameCharacterController
    resources "/dialogues", DialogueController
  end

  # Other scopes may use custom stacks.
  # scope "/api", JaTranslationsWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: JaTranslationsWeb.Telemetry
    end
  end
end
