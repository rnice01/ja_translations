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

  def game_transcript_chapter_factory(attrs) do
    chapter = %JaTranslations.Transcripts.Chapter{
      name: "Some chapter",
      number: 1
    }

    merge_attributes(chapter, attrs)
  end
end
