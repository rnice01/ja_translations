defmodule JaTranslationsWeb.GameTranscriptView do
  use JaTranslationsWeb, :view

  def game_transcript_json(gt) do
    data = %{id: gt.id,
      title: gt.title,
      image: gt.image,
      chapters: Enum.map(gt.chapters,
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

    Jason.encode!(data)
  end
end
