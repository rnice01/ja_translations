defmodule JaTranslationsWeb.GameTranscriptController do
  use JaTranslationsWeb, :controller

  alias JaTranslations.Transcripts
  alias JaTranslations.Transcripts.GameTranscript

  action_fallback JaTranslationsWeb.FallbackController

  def index(conn, _params) do
    game_transcripts = Transcripts.list_game_transcripts()
    render(conn, "index.html", game_transcripts: game_transcripts)
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
    game_transcript = JaTranslations.Transcripts.get_game_transcript!(id)
    data = JaTranslationsWeb.GameTranscriptView.game_transcript_json(game_transcript)
    render(conn, "show.html", game_transcript: data)
  end

  def update(conn, %{"id" => id, "game_transcript" => game_transcript_params}) do
    game_transcript = Transcripts.get_game_transcript!(id)

    with {:ok, %GameTranscript{} = game_transcript} <- Transcripts.update_game_transcript(game_transcript, game_transcript_params) do
      render(conn, "show.json", game_transcript: game_transcript)
    end
  end

  def delete(conn, %{"id" => id}) do
    game_transcript = Transcripts.get_game_transcript!(id)

    with {:ok, %GameTranscript{}} <- Transcripts.delete_game_transcript(game_transcript) do
      send_resp(conn, :no_content, "")
    end
  end
end
