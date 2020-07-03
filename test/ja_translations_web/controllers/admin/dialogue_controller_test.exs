defmodule JaTranslationsWeb.Admin.DialogueControllerTest do
  use JaTranslationsWeb.ConnCase

  alias JaTranslations.Transcripts

  @create_attrs %{context: "some context", english: "some english", grammar_notes: [], japanese: "some japanese", number: 42}
  @update_attrs %{context: "some updated context", english: "some updated english", grammar_notes: [], japanese: "some updated japanese", number: 43}
  @invalid_attrs %{context: nil, english: nil, grammar_notes: nil, japanese: nil, number: nil}

  def fixture(:dialogue) do
    {:ok, dialogue} = Transcripts.create_dialogue(@create_attrs)
    dialogue
  end

  describe "index" do
    test "lists all dialogues", %{conn: conn} do
      conn = get(conn, Routes.admin_dialogue_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Dialogues"
    end
  end

  describe "new dialogue" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.admin_dialogue_path(conn, :new))
      assert html_response(conn, 200) =~ "New Dialogue"
    end
  end

  describe "create dialogue" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.admin_dialogue_path(conn, :create), dialogue: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.admin_dialogue_path(conn, :show, id)

      conn = get(conn, Routes.admin_dialogue_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Dialogue"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.admin_dialogue_path(conn, :create), dialogue: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Dialogue"
    end
  end

  describe "edit dialogue" do
    setup [:create_dialogue]

    test "renders form for editing chosen dialogue", %{conn: conn, dialogue: dialogue} do
      conn = get(conn, Routes.admin_dialogue_path(conn, :edit, dialogue))
      assert html_response(conn, 200) =~ "Edit Dialogue"
    end
  end

  describe "update dialogue" do
    setup [:create_dialogue]

    test "redirects when data is valid", %{conn: conn, dialogue: dialogue} do
      conn = put(conn, Routes.admin_dialogue_path(conn, :update, dialogue), dialogue: @update_attrs)
      assert redirected_to(conn) == Routes.admin_dialogue_path(conn, :show, dialogue)

      conn = get(conn, Routes.admin_dialogue_path(conn, :show, dialogue))
      assert html_response(conn, 200) =~ "some updated context"
    end

    test "renders errors when data is invalid", %{conn: conn, dialogue: dialogue} do
      conn = put(conn, Routes.admin_dialogue_path(conn, :update, dialogue), dialogue: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Dialogue"
    end
  end

  describe "delete dialogue" do
    setup [:create_dialogue]

    test "deletes chosen dialogue", %{conn: conn, dialogue: dialogue} do
      conn = delete(conn, Routes.admin_dialogue_path(conn, :delete, dialogue))
      assert redirected_to(conn) == Routes.admin_dialogue_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.admin_dialogue_path(conn, :show, dialogue))
      end
    end
  end

  defp create_dialogue(_) do
    dialogue = fixture(:dialogue)
    %{dialogue: dialogue}
  end
end
