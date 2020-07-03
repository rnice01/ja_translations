defmodule JaTranslationsWeb.Admin.GameCharacterControllerTest do
  use JaTranslationsWeb.ConnCase

  alias JaTranslations.Transcripts

  @create_attrs %{image: "some image", name: "some name"}
  @update_attrs %{image: "some updated image", name: "some updated name"}
  @invalid_attrs %{image: nil, name: nil}

  def fixture(:game_character) do
    {:ok, game_character} = Transcripts.create_game_character(@create_attrs)
    game_character
  end

  describe "index" do
    test "lists all game_characters", %{conn: conn} do
      conn = get(conn, Routes.admin_game_character_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Game characters"
    end
  end

  describe "new game_character" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.admin_game_character_path(conn, :new))
      assert html_response(conn, 200) =~ "New Game character"
    end
  end

  describe "create game_character" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.admin_game_character_path(conn, :create), game_character: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.admin_game_character_path(conn, :show, id)

      conn = get(conn, Routes.admin_game_character_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Game character"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.admin_game_character_path(conn, :create), game_character: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Game character"
    end
  end

  describe "edit game_character" do
    setup [:create_game_character]

    test "renders form for editing chosen game_character", %{conn: conn, game_character: game_character} do
      conn = get(conn, Routes.admin_game_character_path(conn, :edit, game_character))
      assert html_response(conn, 200) =~ "Edit Game character"
    end
  end

  describe "update game_character" do
    setup [:create_game_character]

    test "redirects when data is valid", %{conn: conn, game_character: game_character} do
      conn = put(conn, Routes.admin_game_character_path(conn, :update, game_character), game_character: @update_attrs)
      assert redirected_to(conn) == Routes.admin_game_character_path(conn, :show, game_character)

      conn = get(conn, Routes.admin_game_character_path(conn, :show, game_character))
      assert html_response(conn, 200) =~ "some updated image"
    end

    test "renders errors when data is invalid", %{conn: conn, game_character: game_character} do
      conn = put(conn, Routes.admin_game_character_path(conn, :update, game_character), game_character: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Game character"
    end
  end

  describe "delete game_character" do
    setup [:create_game_character]

    test "deletes chosen game_character", %{conn: conn, game_character: game_character} do
      conn = delete(conn, Routes.admin_game_character_path(conn, :delete, game_character))
      assert redirected_to(conn) == Routes.admin_game_character_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.admin_game_character_path(conn, :show, game_character))
      end
    end
  end

  defp create_game_character(_) do
    game_character = fixture(:game_character)
    %{game_character: game_character}
  end
end
