defmodule JaTranslationsWeb.Admin.ChapterController do
  use JaTranslationsWeb, :controller

  alias JaTranslations.Transcripts
  alias JaTranslations.Transcripts.Chapter

  def index(conn, %{"game_transcripts_id" => id}) do
    chapters = Transcripts.list_game_transcript_chapters(id)
    render(conn, "index.html", chapters: chapters, game_transcript_id: id)
  end

  def new(conn, %{"game_transcript" => %{"id" => id}}) do
    changeset = Transcripts.change_chapter(%Chapter{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"chapter" => chapter_params}) do
    case Transcripts.create_chapter(chapter_params) do
      {:ok, chapter} ->
        conn
        |> put_flash(:info, "Chapter created successfully.")
        |> redirect(to: Routes.admin_chapter_path(conn, :show, chapter))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    chapter = Transcripts.get_chapter!(id)
    render(conn, "show.html", chapter: chapter)
  end

  def edit(conn, %{"id" => id}) do
    chapter = Transcripts.get_chapter!(id)
    changeset = Transcripts.change_chapter(chapter)
    render(conn, "edit.html", chapter: chapter, changeset: changeset)
  end

  def update(conn, %{"id" => id, "chapter" => chapter_params}) do
    chapter = Transcripts.get_chapter!(id)

    case Transcripts.update_chapter(chapter, chapter_params) do
      {:ok, chapter} ->
        conn
        |> put_flash(:info, "Chapter updated successfully.")
        |> redirect(to: Routes.admin_chapter_path(conn, :show, chapter))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", chapter: chapter, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    chapter = Transcripts.get_chapter!(id)
    {:ok, _chapter} = Transcripts.delete_chapter(chapter)

    conn
    |> put_flash(:info, "Chapter deleted successfully.")
    |> redirect(to: Routes.admin_chapter_path(conn, :index))
  end
end
