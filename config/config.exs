# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :ja_translations,
  ecto_repos: [JaTranslations.Repo]

# Configures the endpoint
config :ja_translations, JaTranslationsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "dPK32GHx9M2HR/FAM0XlbBLk/HgaDWKEH/Qm30mP87aHLYFsZiojQMObZumrTwUB",
  render_errors: [view: JaTranslationsWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: JaTranslations.PubSub,
  live_view: [signing_salt: "nIoUW5qu"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :ja_translations, JaTranslations.Accounts.Guardian,
  issuer: "ja_translation",
  secret_key: ""

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
