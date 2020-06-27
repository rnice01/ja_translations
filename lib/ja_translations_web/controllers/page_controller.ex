defmodule JaTranslationsWeb.PageController do
  use JaTranslationsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
