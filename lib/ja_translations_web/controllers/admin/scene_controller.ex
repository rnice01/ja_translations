defmodule JaTranslationsWeb.Admin.SceneController do
  use JaTranslationsWeb, :controller

  alias JaTranslations.Transcripts
  alias JaTranslations.Transcripts.Scene

  def index(conn, _params) do
    scenes = Transcripts.list_scenes()
    render(conn, "index.html", scenes: scenes)
  end

  def new(conn, _params) do
    changeset = Transcripts.change_scene(%Scene{})
    render(conn, "new.html", changeset: changeset)
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

  def show(conn, %{"id" => id}) do
    scene = Transcripts.get_scene!(id)
    render(conn, "show.html", scene: scene)
  end

  def edit(conn, %{"id" => id}) do
    scene = Transcripts.get_scene!(id)
    changeset = Transcripts.change_scene(scene)
    render(conn, "edit.html", scene: scene, changeset: changeset)
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
