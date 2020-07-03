defmodule JaTranslations.Api.GameTranscriptView do
  use JaTranslationsWeb, :view
  alias JaTranslationsWeb.GameTranscriptView

  def render("index.json", %{game_transcripts: game_transcripts}) do
    %{data: render_many(game_transcripts, GameTranscriptView, "game_transcript.json")}
  end

  def render("show.json", %{game_transcript: game_transcript}) do
    %{data: render_one(game_transcript, GameTranscriptView, "game_transcript.json")}
  end

  def render("game_transcript.json", %{game_transcript: game_transcript}) do
    %{id: game_transcript.id,
      title: game_transcript.title,
      image: game_transcript.image,
      chapters: Enum.map(game_transcript.chapters,
        fn %{id: id, name: n, number: nm, scenes: s} -> %{
          "id" => id,
          "name" => n,
          "number" => nm,
          "scenes" => Enum.map(s, fn %{id: id, number: n, title: t} -> %{
            "id" => id,
            "title" => t,
            "number" => n
          } end)
        }
      end)
    }
  end

  def render("scene.json", %{scene: s}) do
    %{
      id: s.id,
      title: s.title,
      description: s.description,
      image: s.image,
      dialogues: Enum.map(s.dialogues, fn %{
        context: c,
        japanese: j,
        english: e,
        grammar_notes: gn,
        character: ch
      } ->
        s = %{
          context: c,
          japanese: j,
          english: e,
          grammar_notes: gn,
          character: %{}
        }
        if ch do
          Map.put(s, :character, %{id: ch.id, name: ch.name, image: ch.image})
        end
        s
      end)
    }
  end
end
