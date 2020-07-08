defmodule JaTranslationsWeb.Admin.GameTranscriptController do
  use JaTranslationsWeb, :controller

  alias JaTranslations.Transcripts
  alias JaTranslations.Transcripts.GameTranscript

  def index(conn, _params) do
    game_transcripts = Transcripts.list_game_transcripts()
    render(conn, "index.html", game_transcripts: game_transcripts)
  end

  def new(conn, _params) do
    changeset = Transcripts.change_game_transcript(%GameTranscript{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"game_transcript" => game_transcript_params}) do
    case Transcripts.create_game_transcript(game_transcript_params) do
      {:ok, game_transcript} ->
        conn
        |> put_flash(:info, "Game transcript created successfully.")
        |> redirect(to: Routes.admin_game_transcript_path(conn, :show, game_transcript))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    game_transcript = Transcripts.get_game_transcript!(id)
    render(conn, "show.html", game_transcript: game_transcript)
  end

  def edit(conn, %{"id" => id}) do
    game_transcript = Transcripts.get_game_transcript!(id)
    changeset = Transcripts.change_game_transcript(game_transcript)
    render(conn, "edit.html", game_transcript: game_transcript, changeset: changeset)
  end

  def update(conn, %{"id" => id, "game_transcript" => game_transcript_params}) do
    game_transcript = Transcripts.get_game_transcript!(id)

    case Transcripts.update_game_transcript(game_transcript, game_transcript_params) do
      {:ok, game_transcript} ->
        conn
        |> put_flash(:info, "Game transcript updated successfully.")
        |> redirect(to: Routes.admin_game_transcript_path(conn, :show, game_transcript))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", game_transcript: game_transcript, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    game_transcript = Transcripts.get_game_transcript!(id)
    {:ok, _game_transcript} = Transcripts.delete_game_transcript(game_transcript)

    conn
    |> put_flash(:info, "Game transcript deleted successfully.")
    |> redirect(to: Routes.admin_game_transcript_path(conn, :index))
  end
end
