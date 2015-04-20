# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :kukariri, Kukariri.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "HnCEtLCJnUDRbWFxeU2dl7svuD82WVtCDAZD9JQaX9UPPxyg7AfkpMo367s4Rfvz",
  debug_errors: false,
  pubsub: [adapter: Phoenix.PubSub.PG2]
  #pubsub: [name: Kukariri.PubSub, adapter: Phoenix.PubSub.PG2],
# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]
# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.

config :kukariri, Kukariri.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "kukariri",
  hostname: "localhost",
  username: "nicolas",
  password: "infonies"
import_config "#{Mix.env}.exs"
