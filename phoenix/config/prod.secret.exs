# In this file, we load production configuration and secrets
# from environment variables. You can also hardcode secrets,
# although such is generally not recommended and you have to
# remember to add this file to your .gitignore.
use Mix.Config

config :phoenix_benchmark, PhoenixBenchmark.Repo,
  username: "postgres",
  password: "postgres",
  database: "benchmark_compare_dev",
  hostname: "localhost",
  show_sensitive_data_on_connection_error: true,
	pool_size: 20
	
secret_key_base = "foo"
  # System.get_env("SECRET_KEY_BASE") ||
  #   raise """
  #   environment variable SECRET_KEY_BASE is missing.
  #   You can generate one by calling: mix phx.gen.secret
  #   """

config :phoenix_benchmark, PhoenixBenchmarkWeb.Endpoint,
  http: [:inet6, port: String.to_integer(System.get_env("PORT") || "4000")],
  secret_key_base: secret_key_base

# ## Using releases (Elixir v1.9+)
#
# If you are doing OTP releases, you need to instruct Phoenix
# to start each relevant endpoint:
#
#     config :phoenix_benchmark, PhoenixBenchmarkWeb.Endpoint, server: true
#
# Then you can assemble a release by calling `mix release`.
# See `mix help release` for more information.
