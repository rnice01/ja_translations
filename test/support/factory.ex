defmodule JaTranslations.Factory do
  use ExMachina.Ecto, repo: JaTranslations.Repo

  def admin_factory do
    %JaTranslations.Accounts.User{
      username: "some admin",
      email: "some_admin@domain.com",
      is_admin: true
    }
  end

  def user_factory do
    %JaTranslations.Accounts.User{
      username: "some username",
      email: "email@domain.com",
      is_admin: false
    }
  end

  def game_transcript_factory do
    %JaTranslations.Transcripts.GameTranscript{
      title: "some title",
      image: "some image"
    }
  end

  def chapter_factory(attrs) do
    chapter = %JaTranslations.Transcripts.Chapter{
      name: "Some chapter",
      number: 1
    }

    merge_attributes(chapter, attrs)
  end

  def game_transcript_chapter_factory do
    %JaTranslations.Transcripts.GameTranscript{
      title: "some title",
      image: "some image",
      chapters: [
        build(:chapter)
      ]
    }
  end

  def scene_factory(attrs) do
    scene = %JaTranslations.Transcripts.Scene{
      title: "Scene title",
      description: "Scene description",
      number: 1,
    }

    merge_attributes(scene, attrs)
  end
end
