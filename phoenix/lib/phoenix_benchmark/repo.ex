defmodule PhoenixBenchmark.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_benchmark,
    adapter: Ecto.Adapters.Postgres
end
