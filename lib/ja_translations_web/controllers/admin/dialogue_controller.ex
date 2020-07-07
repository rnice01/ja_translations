defmodule JaTranslationsWeb.Admin.DialogueController do
  use JaTranslationsWeb, :controller

  alias JaTranslations.Transcripts
  alias JaTranslations.Transcripts.Dialogue

  def index(conn, %{"scene_id" => id}) do
    dialogues = Transcripts.scene_dialogues(id)
    render(conn, "index.html", dialogues: dialogues)
  end

  def new(conn, _params) do
    changeset = Transcripts.change_dialogue(%Dialogue{})
    render(conn, "new.html", changeset: changeset)
  end

   def create(conn, %{"dialogue" => dialogue_params, "redirect" => redirect}) do
    case Transcripts.create_dialogue(dialogue_params) do
      {:ok, _dialogue} ->
        conn
        |> put_flash(:info, "Dialogue created successfully.")
        |> redirect(to: redirect)

      {:error, %Ecto.Changeset{} = changeset} ->
        conn.redirect(to: redirect, changeset: changeset)
        #render(conn, "new.html", changeset: changeset)
    end
  end

  def create(conn, %{"dialogue" => dialogue_params}) do
    case Transcripts.create_dialogue(dialogue_params) do
      {:ok, dialogue} ->
        conn
        |> put_flash(:info, "Dialogue created successfully.")
        |> redirect(to: Routes.admin_scene_dialogue_path(conn, :show, dialogue.scene_id, dialogue.id))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"scene_id" => scene_id, "id" => id}) do
    dialogue = Transcripts.get_dialogue!(id)
    render(conn, "show.html", dialogue: dialogue, scene_id: scene_id)
  end

  def edit(conn, %{"scene_id" => scene_id, "id" => id}) do
    dialogue = Transcripts.get_dialogue!(id)
    changeset = Transcripts.change_dialogue(dialogue)
    render(conn, "edit.html", dialogue: dialogue, changeset: changeset, scene_id: scene_id)
  end

  def update(conn, %{"id" => id, "dialogue" => dialogue_params}) do
    dialogue = Transcripts.get_dialogue!(id)

    case Transcripts.update_dialogue(dialogue, dialogue_params) do
      {:ok, dialogue} ->
        conn
        |> put_flash(:info, "Dialogue updated successfully.")
        |> redirect(to: Routes.admin_dialogue_path(conn, :show, dialogue))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", dialogue: dialogue, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    dialogue = Transcripts.get_dialogue!(id)
    {:ok, _dialogue} = Transcripts.delete_dialogue(dialogue)

    conn
    |> put_flash(:info, "Dialogue deleted successfully.")
    |> redirect(to: Routes.admin_dialogue_path(conn, :index))
  end
end
