defmodule JaTranslationsWeb.Admin.SceneControllerTest do
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
      gtc = insert(:game_transcript_chapter)
      [chapter1 | _] = gtc.chapters
      scene1 = insert(:scene, chapter: chapter1)

      conn = get(conn, Routes.admin_chapter_scene_path(conn, :index, chapter1.id))
      assert html_response(conn, 200) =~ scene1.title
      assert html_response(conn, 200) =~ scene1.description
    end
  end
end
