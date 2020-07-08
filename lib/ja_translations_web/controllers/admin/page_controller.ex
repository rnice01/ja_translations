defmodule JaTranslationsWeb.Admin.PageController do
  use JaTranslationsWeb, :controller

  def index(conn, _params) do
    user = Guardian.Plug.current_resource(conn)
    render(conn, "index.html", current_user: user)
  end
end
