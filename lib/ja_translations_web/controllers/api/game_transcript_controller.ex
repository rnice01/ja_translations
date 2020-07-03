defmodule JaTranslations.Api.GameTranscriptController do
  use JaTranslationsWeb, :controller

  alias JaTranslations.Transcripts
  alias JaTranslations.Transcripts.GameTranscript

  action_fallback JaTranslationsWeb.FallbackController

  def index(conn, _params) do
    game_transcripts = Transcripts.list_game_transcripts()
    render(conn, "index.json", game_transcripts: game_transcripts)
  end

  def create(conn, %{"game_transcript" => game_transcript_params}) do
    with {:ok, %GameTranscript{} = game_transcript} <- Transcripts.create_game_transcript(game_transcript_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.game_transcript_path(conn, :show, game_transcript))
      |> render("show.json", game_transcript: game_transcript)
    end
  end

  def show(conn, %{"id" => id}) do
    game_transcript = Transcripts.get_game_transcript!(id)
    render(conn, "show.json", game_transcript: game_transcript)
  end

  def by_title(conn, %{"title" => title}) do
    game_transcript = Transcripts.get_game_transcript_by_title(title)
    render(conn, "show.json", game_transcript: game_transcript)
  end

  def scenes(conn, %{"id" => id}) do
    scene = Transcripts.get_scene(id)
    render(conn, "scene.json", scene: scene)
  end
end
