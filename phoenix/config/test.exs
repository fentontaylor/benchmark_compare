use Mix.Config

# Configure your database
config :phoenix_benchmark, PhoenixBenchmark.Repo,
  username: "postgres",
  password: "postgres",
  database: "phoenix_benchmark_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :phoenix_benchmark, PhoenixBenchmarkWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
