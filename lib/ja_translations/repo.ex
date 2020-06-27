defmodule JaTranslations.Repo do
  use Ecto.Repo,
    otp_app: :ja_translations,
    adapter: Ecto.Adapters.Postgres
end
