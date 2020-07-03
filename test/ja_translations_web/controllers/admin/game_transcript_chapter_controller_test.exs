defmodule JaTranslationsWeb.Admin.ChapterControllerTest do
  use JaTranslationsWeb.ConnCase
  import JaTranslations.Factory

  alias JaTranslations.Transcripts
  alias JaTranslations.Accounts.Guardian

  setup %{conn: conn} do
    user = insert(:admin)
    {:ok, jwt, _claims} = Guardian.encode_and_sign( user, %{"some" => "claim"})
    conn =
      conn
      #|> put_req_header("accept", "application/json")
      |> put_req_header("authorization", "Bearer #{jwt}")

    [conn: conn]
  end

  describe "index" do
    test "lists all chapters belonging to the game transcript", %{conn: conn} do
      game_transcript = insert(:game_transcript)
      chapter1 = insert(:game_transcript_chapter, name: "hi chapter 1", game_transcript_id: game_transcript.id)
      chapter2 = insert(:game_transcript_chapter, name: "hi chapter 2", game_transcript_id: game_transcript.id)
      conn = get(conn, Routes.admin_game_transcripts_chapter_path(conn, :index, game_transcript.id))
      assert html_response(conn, 200) =~ chapter1.name
      assert html_response(conn, 200) =~ chapter2.name
    end
  end
end
