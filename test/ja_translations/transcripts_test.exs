defmodule JaTranslations.TranscriptsTest do
  use JaTranslations.DataCase

  alias JaTranslations.Transcripts

  describe "game_transcripts" do
    alias JaTranslations.Transcripts.GameTranscript

    @valid_attrs %{image: "some image", title: "some title"}
    @update_attrs %{image: "some updated image", title: "some updated title"}
    @invalid_attrs %{image: nil, title: nil}

    def game_transcript_fixture(attrs \\ %{}) do
      {:ok, game_transcript} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Transcripts.create_game_transcript()

      game_transcript
    end

    test "list_game_transcripts/0 returns all game_transcripts" do
      game_transcript = game_transcript_fixture()
      assert Transcripts.list_game_transcripts() == [game_transcript]
    end

    test "get_game_transcript!/1 returns the game_transcript with given id" do
      game_transcript = game_transcript_fixture()
      assert Transcripts.get_game_transcript!(game_transcript.id) == game_transcript
    end

    test "create_game_transcript/1 with valid data creates a game_transcript" do
      assert {:ok, %GameTranscript{} = game_transcript} = Transcripts.create_game_transcript(@valid_attrs)
      assert game_transcript.image == "some image"
      assert game_transcript.title == "some title"
    end

    test "create_game_transcript/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Transcripts.create_game_transcript(@invalid_attrs)
    end

    test "update_game_transcript/2 with valid data updates the game_transcript" do
      game_transcript = game_transcript_fixture()
      assert {:ok, %GameTranscript{} = game_transcript} = Transcripts.update_game_transcript(game_transcript, @update_attrs)
      assert game_transcript.image == "some updated image"
      assert game_transcript.title == "some updated title"
    end

    test "update_game_transcript/2 with invalid data returns error changeset" do
      game_transcript = game_transcript_fixture()
      assert {:error, %Ecto.Changeset{}} = Transcripts.update_game_transcript(game_transcript, @invalid_attrs)
      assert game_transcript == Transcripts.get_game_transcript!(game_transcript.id)
    end

    test "delete_game_transcript/1 deletes the game_transcript" do
      game_transcript = game_transcript_fixture()
      assert {:ok, %GameTranscript{}} = Transcripts.delete_game_transcript(game_transcript)
      assert_raise Ecto.NoResultsError, fn -> Transcripts.get_game_transcript!(game_transcript.id) end
    end

    test "change_game_transcript/1 returns a game_transcript changeset" do
      game_transcript = game_transcript_fixture()
      assert %Ecto.Changeset{} = Transcripts.change_game_transcript(game_transcript)
    end
  end
end
