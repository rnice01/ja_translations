defmodule JaTranslationsWeb.Admin.GameTranscriptControllerTest do
  use JaTranslationsWeb.ConnCase

  alias JaTranslations.Transcripts

  @create_attrs %{image: "some image", title: "some title"}
  @update_attrs %{image: "some updated image", title: "some updated title"}
  @invalid_attrs %{image: nil, title: nil}

  def fixture(:game_transcript) do
    {:ok, game_transcript} = Transcripts.create_game_transcript(@create_attrs)
    game_transcript
  end

  describe "index" do
    test "lists all game_transcripts", %{conn: conn} do
      conn = get(conn, Routes.admin_game_transcript_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Game transcripts"
    end
  end

  describe "new game_transcript" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.admin_game_transcript_path(conn, :new))
      assert html_response(conn, 200) =~ "New Game transcript"
    end
  end

  describe "create game_transcript" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.admin_game_transcript_path(conn, :create), game_transcript: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.admin_game_transcript_path(conn, :show, id)

      conn = get(conn, Routes.admin_game_transcript_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Game transcript"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.admin_game_transcript_path(conn, :create), game_transcript: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Game transcript"
    end
  end

  describe "edit game_transcript" do
    setup [:create_game_transcript]

    test "renders form for editing chosen game_transcript", %{conn: conn, game_transcript: game_transcript} do
      conn = get(conn, Routes.admin_game_transcript_path(conn, :edit, game_transcript))
      assert html_response(conn, 200) =~ "Edit Game transcript"
    end
  end

  describe "update game_transcript" do
    setup [:create_game_transcript]

    test "redirects when data is valid", %{conn: conn, game_transcript: game_transcript} do
      conn = put(conn, Routes.admin_game_transcript_path(conn, :update, game_transcript), game_transcript: @update_attrs)
      assert redirected_to(conn) == Routes.admin_game_transcript_path(conn, :show, game_transcript)

      conn = get(conn, Routes.admin_game_transcript_path(conn, :show, game_transcript))
      assert html_response(conn, 200) =~ "some updated image"
    end

    test "renders errors when data is invalid", %{conn: conn, game_transcript: game_transcript} do
      conn = put(conn, Routes.admin_game_transcript_path(conn, :update, game_transcript), game_transcript: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Game transcript"
    end
  end

  describe "delete game_transcript" do
    setup [:create_game_transcript]

    test "deletes chosen game_transcript", %{conn: conn, game_transcript: game_transcript} do
      conn = delete(conn, Routes.admin_game_transcript_path(conn, :delete, game_transcript))
      assert redirected_to(conn) == Routes.admin_game_transcript_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.admin_game_transcript_path(conn, :show, game_transcript))
      end
    end
  end

  defp create_game_transcript(_) do
    game_transcript = fixture(:game_transcript)
    %{game_transcript: game_transcript}
  end
end
