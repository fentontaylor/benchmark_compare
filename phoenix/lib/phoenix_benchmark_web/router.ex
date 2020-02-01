defmodule PhoenixBenchmarkWeb.Router do
  use PhoenixBenchmarkWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PhoenixBenchmarkWeb do
    pipe_through :api
  end
end
