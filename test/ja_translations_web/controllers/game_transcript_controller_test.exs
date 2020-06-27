defmodule JaTranslationsWeb.GameTranscriptControllerTest do
  use JaTranslationsWeb.ConnCase

  alias JaTranslations.Transcripts
  alias JaTranslations.Transcripts.GameTranscript

  @create_attrs %{
    image: "some image",
    title: "some title"
  }
  @update_attrs %{
    image: "some updated image",
    title: "some updated title"
  }
  @invalid_attrs %{image: nil, title: nil}

  def fixture(:game_transcript) do
    {:ok, game_transcript} = Transcripts.create_game_transcript(@create_attrs)
    game_transcript
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all game_transcripts", %{conn: conn} do
      conn = get(conn, Routes.game_transcript_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create game_transcript" do
    test "renders game_transcript when data is valid", %{conn: conn} do
      conn = post(conn, Routes.game_transcript_path(conn, :create), game_transcript: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.game_transcript_path(conn, :show, id))

      assert %{
               "id" => id,
               "image" => "some image",
               "title" => "some title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.game_transcript_path(conn, :create), game_transcript: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update game_transcript" do
    setup [:create_game_transcript]

    test "renders game_transcript when data is valid", %{conn: conn, game_transcript: %GameTranscript{id: id} = game_transcript} do
      conn = put(conn, Routes.game_transcript_path(conn, :update, game_transcript), game_transcript: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.game_transcript_path(conn, :show, id))

      assert %{
               "id" => id,
               "image" => "some updated image",
               "title" => "some updated title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, game_transcript: game_transcript} do
      conn = put(conn, Routes.game_transcript_path(conn, :update, game_transcript), game_transcript: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete game_transcript" do
    setup [:create_game_transcript]

    test "deletes chosen game_transcript", %{conn: conn, game_transcript: game_transcript} do
      conn = delete(conn, Routes.game_transcript_path(conn, :delete, game_transcript))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.game_transcript_path(conn, :show, game_transcript))
      end
    end
  end

  defp create_game_transcript(_) do
    game_transcript = fixture(:game_transcript)
    %{game_transcript: game_transcript}
  end
end
