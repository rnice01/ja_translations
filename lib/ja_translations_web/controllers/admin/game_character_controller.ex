defmodule JaTranslationsWeb.Admin.GameCharacterController do
  use JaTranslationsWeb, :controller

  alias JaTranslations.Transcripts
  alias JaTranslations.Transcripts.GameCharacter

  def index(conn, _params) do
    game_characters = Transcripts.list_game_characters()
    render(conn, "index.html", game_characters: game_characters)
  end

  def new(conn, _params) do
    changeset = Transcripts.change_game_character(%GameCharacter{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"game_character" => game_character_params}) do
    case Transcripts.create_game_character(game_character_params) do
      {:ok, game_character} ->
        conn
        |> put_flash(:info, "Game character created successfully.")
        |> redirect(to: Routes.admin_game_character_path(conn, :show, game_character))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    game_character = Transcripts.get_game_character!(id)
    render(conn, "show.html", game_character: game_character)
  end

  def edit(conn, %{"id" => id}) do
    game_character = Transcripts.get_game_character!(id)
    changeset = Transcripts.change_game_character(game_character)
    render(conn, "edit.html", game_character: game_character, changeset: changeset)
  end

  def update(conn, %{"id" => id, "game_character" => game_character_params}) do
    game_character = Transcripts.get_game_character!(id)

    case Transcripts.update_game_character(game_character, game_character_params) do
      {:ok, game_character} ->
        conn
        |> put_flash(:info, "Game character updated successfully.")
        |> redirect(to: Routes.admin_game_character_path(conn, :show, game_character))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", game_character: game_character, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    game_character = Transcripts.get_game_character!(id)
    {:ok, _game_character} = Transcripts.delete_game_character(game_character)

    conn
    |> put_flash(:info, "Game character deleted successfully.")
    |> redirect(to: Routes.admin_game_character_path(conn, :index))
  end
end
