defmodule JaTranslationsWeb.PageController do
  use JaTranslationsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def flash_cards(conn, _params) do
    render(conn, "flash_cards.html", flashcards: Jason.encode!(%{"key" => "val"}))
  end
end
