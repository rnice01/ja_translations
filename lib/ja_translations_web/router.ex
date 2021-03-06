defmodule JaTranslationsWeb.Router do
  use JaTranslationsWeb, :router
  use Pow.Phoenix.Router

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

  pipeline :protected do
    plug Pow.Plug.RequireAuthenticated,
      error_handler: Pow.Phoenix.PlugErrorHandler
  end

  pipeline :admin do
    plug JaTranslationsWeb.EnsureRolePlug, :admin
  end

  pipeline :api do
    plug :accepts, ["json"]
    scope "/api", JaTranslations.Api, as: :api do
      get "/game-transcripts/:id", GameTranscriptController, :show
      get "/game-transcripts/title/:title", GameTranscriptController, :by_title
      get "/scenes/:id", GameTranscriptController, :scenes
    end
  end

  scope "/" do
    pipe_through [:browser]
    pow_routes()
  end

  scope "/", JaTranslationsWeb do
    pipe_through [:browser]

    get "/", PageController, :index
    get "/game-transcripts", GameTranscriptController, :index
    get "/game-transcripts/:id", GameTranscriptController, :show
  end

  scope "/admin", JaTranslationsWeb.Admin, as: :admin do
    pipe_through [:browser, :admin_layout, :protected, :admin]

    get "/", PageController, :index
    resources "/game-transcripts", GameTranscriptController do
      resources "/chapters", ChapterController
      resources "/characters", GameCharactersController
    end

    resources "/chapters", ChapterController do
      resources "/scenes", SceneController
    end

    resources "/scenes", SceneController do
      resources "/dialogues", DialogueController
    end
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
