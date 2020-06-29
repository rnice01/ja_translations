# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     JaTranslations.Repo.insert!(%JaTranslations.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.


gt = JaTranslations.Repo.insert!(%JaTranslations.Transcripts.GameTranscript{title: "Pokemon Sword"})

ch1 = JaTranslations.Repo.insert!(%JaTranslations.Transcripts.Chapter{name: "Chapter 1", number: 0, game_transcript: gt})
ch2 = JaTranslations.Repo.insert!(%JaTranslations.Transcripts.Chapter{name: "Chapter 2", number: 1, game_transcript: gt})
ch3 = JaTranslations.Repo.insert!(%JaTranslations.Transcripts.Chapter{name: "Chapter 3", number: 2, game_transcript: gt})

sc1_1 = JaTranslations.Repo.insert!(%JaTranslations.Transcripts.Scene{number: 0, title: "At player's house 1", chapter: ch1})
sc1_2 = JaTranslations.Repo.insert!(%JaTranslations.Transcripts.Scene{number: 0, title: "Outside player's house 1", chapter: ch1})
sc1_3 = JaTranslations.Repo.insert!(%JaTranslations.Transcripts.Scene{number: 0, title: "At rival's house 1", chapter: ch1})

sc2_1 = JaTranslations.Repo.insert!(%JaTranslations.Transcripts.Scene{number: 0, title: "At Player's house 2", chapter: ch2})
sc2_2 = JaTranslations.Repo.insert!(%JaTranslations.Transcripts.Scene{number: 0, title: "Outside player's house 2", chapter: ch2})
sc2_3 = JaTranslations.Repo.insert!(%JaTranslations.Transcripts.Scene{number: 0, title: "At rivals house 2", chapter: ch2})

JaTranslations.Repo.insert!(
  %JaTranslations.Transcripts.Scene{
    number: 0,
    title: "At rival's house 3",
    chapter: ch3,
    dialogues: [
      %JaTranslations.Transcripts.Dialogue{
        japanese: "untranslated text goes here for chapter 3 scene1",
        number: 0
      },
      %JaTranslations.Transcripts.Dialogue{
        japanese: "untranslated text goes here for chapter 3 scene 2",
        number: 0
      }
    ]
  }
)


JaTranslations.Repo.insert!(%JaTranslations.Transcripts.Dialogue{japanese: "hey where were you?", number: 0, scene: sc1_1})
JaTranslations.Repo.insert!(%JaTranslations.Transcripts.Dialogue{japanese: "I was here", number: 1, scene: sc1_1})
JaTranslations.Repo.insert!(%JaTranslations.Transcripts.Dialogue{japanese: "What?", number: 2, scene: sc1_1})

JaTranslations.Repo.insert!(%JaTranslations.Transcripts.Dialogue{japanese: "hey where were you?", number: 0, scene: sc1_2})
JaTranslations.Repo.insert!(%JaTranslations.Transcripts.Dialogue{japanese: "I was here", number: 1, scene: sc1_2})
JaTranslations.Repo.insert!(%JaTranslations.Transcripts.Dialogue{japanese: "What?", number: 2, scene: sc1_2})

JaTranslations.Repo.insert!(%JaTranslations.Transcripts.Dialogue{japanese: "hey where were you?", number: 0, scene: sc1_1})
JaTranslations.Repo.insert!(%JaTranslations.Transcripts.Dialogue{japanese: "I was here", number: 1, scene: sc1_1})
JaTranslations.Repo.insert!(%JaTranslations.Transcripts.Dialogue{japanese: "What?", number: 2, scene: sc1_1})

JaTranslations.Accounts.create_user(%{username: "user", email: "my@email.com", password: "password"})
