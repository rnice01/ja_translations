defmodule JaTranslationsWeb.Admin.SceneView do
  use JaTranslationsWeb, :view

  def character_options(game_characters) do
    Enum.map(game_characters, fn gc -> {
      {gc.name, gc.id}
    }end)
  end
end
