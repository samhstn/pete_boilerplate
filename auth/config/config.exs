# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :pete,
  ecto_repos: [Pete.Repo]

# Configures the endpoint
config :pete, PeteWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "M5MCu+3aSIOlFUiMF4pPNpZsbfcwYVsx3kTuLfUn4MDAqrSNjQ6nmpx8eMWaAt9N",
  render_errors: [view: PeteWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Pete.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :pete, Pete.Auth.Guardian,
  issuer: "pete",
  secret_key: "KsEJIbKew7LFsdpeoHdbir0D+k2ISJ5XNBpNjUasIv2ywvhWNsdeZqjLiyRlYaU5"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
