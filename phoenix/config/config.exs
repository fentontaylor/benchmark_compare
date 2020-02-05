# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :phoenix_benchmark,
  ecto_repos: [PhoenixBenchmark.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :phoenix_benchmark, PhoenixBenchmarkWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "7+6Ev8ZWN6mZmSNoPG6/yHBlO7C1OnUflflk8qSSX+ht2KyuSfcJyH5nNpc7fyzA",
  render_errors: [view: PhoenixBenchmarkWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: PhoenixBenchmark.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
