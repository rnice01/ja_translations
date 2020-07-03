defmodule JaTranslationsWeb.Admin.SceneControllerTest do
  use JaTranslationsWeb.ConnCase

  alias JaTranslations.Transcripts

  @create_attrs %{description: "some description", image: "some image", number: 42, title: "some title"}
  @update_attrs %{description: "some updated description", image: "some updated image", number: 43, title: "some updated title"}
  @invalid_attrs %{description: nil, image: nil, number: nil, title: nil}

  def fixture(:scene) do
    {:ok, scene} = Transcripts.create_scene(@create_attrs)
    scene
  end

  describe "index" do
    test "lists all scenes", %{conn: conn} do
      conn = get(conn, Routes.admin_scene_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Scenes"
    end
  end

  describe "new scene" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.admin_scene_path(conn, :new))
      assert html_response(conn, 200) =~ "New Scene"
    end
  end

  describe "create scene" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.admin_scene_path(conn, :create), scene: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.admin_scene_path(conn, :show, id)

      conn = get(conn, Routes.admin_scene_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Scene"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.admin_scene_path(conn, :create), scene: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Scene"
    end
  end

  describe "edit scene" do
    setup [:create_scene]

    test "renders form for editing chosen scene", %{conn: conn, scene: scene} do
      conn = get(conn, Routes.admin_scene_path(conn, :edit, scene))
      assert html_response(conn, 200) =~ "Edit Scene"
    end
  end

  describe "update scene" do
    setup [:create_scene]

    test "redirects when data is valid", %{conn: conn, scene: scene} do
      conn = put(conn, Routes.admin_scene_path(conn, :update, scene), scene: @update_attrs)
      assert redirected_to(conn) == Routes.admin_scene_path(conn, :show, scene)

      conn = get(conn, Routes.admin_scene_path(conn, :show, scene))
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, scene: scene} do
      conn = put(conn, Routes.admin_scene_path(conn, :update, scene), scene: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Scene"
    end
  end

  describe "delete scene" do
    setup [:create_scene]

    test "deletes chosen scene", %{conn: conn, scene: scene} do
      conn = delete(conn, Routes.admin_scene_path(conn, :delete, scene))
      assert redirected_to(conn) == Routes.admin_scene_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.admin_scene_path(conn, :show, scene))
      end
    end
  end

  defp create_scene(_) do
    scene = fixture(:scene)
    %{scene: scene}
  end
end
