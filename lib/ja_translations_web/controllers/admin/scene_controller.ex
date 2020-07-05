defmodule JaTranslationsWeb.Admin.SceneController do
  use JaTranslationsWeb, :controller

  alias JaTranslations.Transcripts
  alias JaTranslations.Transcripts.Scene
  alias JaTranslations.Transcripts.Dialogue

  def index(conn, %{"chapter_id" => id}) do
    scenes = Transcripts.chapter_scenes(id)
    render(conn, "index.html", scenes: scenes, chapter_id: id)
  end

  def new(conn, %{"chapter_id" => id}) do
    changeset = Transcripts.change_scene(%Scene{})
    render(conn, "new.html", changeset: changeset, chapter_id: id)
  end

  def create(conn, %{"scene" => scene_params}) do
    case Transcripts.create_scene(scene_params) do
      {:ok, scene} ->
        conn
        |> put_flash(:info, "Scene created successfully.")
        |> redirect(to: Routes.admin_scene_path(conn, :show, scene))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def create_dialogue(conn, %{"dialogue" => dialogue_params}) do
    case Transcripts.create_dialogue(dialogue_params) do
    {:ok, dialogue} ->
      conn
      |> put_flash(:info, "Dialogue created for scene.")
      |> redirect(to: Routes.admin_scene_path(conn, :show, dialogue.scene_id))

      {:error, %Ecto.Changeset{} = changeset} ->
        scene = Transcripts.get_scene!(dialogue_params.scene_id)
        render(conn, "show.html", scene: scene, dialogue_changeset: changeset)
      end
  end

  def show(conn, %{"id" => id}) do
    scene = Transcripts.get_scene!(id)
    dialogue_changeset = Transcripts.change_dialogue(%Dialogue{})
    characters = Transcripts.list_game_characters()
    render(conn, "show.html", scene: scene, dialogue_changeset: dialogue_changeset, game_characters: characters)
  end

  def edit(conn, %{"id" => id, "chapter_id" => chapter_id}) do
    scene = Transcripts.get_scene!(id)
    changeset = Transcripts.change_scene(scene)
    render(conn, "edit.html", scene: scene, changeset: changeset, chapter_id: chapter_id)
  end

  def update(conn, %{"id" => id, "scene" => scene_params}) do
    scene = Transcripts.get_scene!(id)

    case Transcripts.update_scene(scene, scene_params) do
      {:ok, scene} ->
        conn
        |> put_flash(:info, "Scene updated successfully.")
        |> redirect(to: Routes.admin_scene_path(conn, :show, scene))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", scene: scene, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    scene = Transcripts.get_scene!(id)
    {:ok, _scene} = Transcripts.delete_scene(scene)

    conn
    |> put_flash(:info, "Scene deleted successfully.")
    |> redirect(to: Routes.admin_scene_path(conn, :index))
  end
end
