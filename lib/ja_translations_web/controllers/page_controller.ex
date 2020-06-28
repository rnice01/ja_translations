defmodule JaTranslationsWeb.PageController do
  use JaTranslationsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def game_translations(conn, _params) do
    transcripts = JaTranslations.Transcripts.list_game_transcripts()
    |> Enum.map(fn %{title: t, id: id} -> %{"id" => id, "title" => t} end)
    |> Jason.encode!
    render(conn, "game_translations.html", data: transcripts)
  end
end
