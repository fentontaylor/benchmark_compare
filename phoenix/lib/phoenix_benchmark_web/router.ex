defmodule PhoenixBenchmarkWeb.Router do
  use PhoenixBenchmarkWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhoenixBenchmarkWeb do
		pipe_through :api
		get "/", BenchmarkController, :welcome
		# get "/olympians", BenchmarkController, :olympians
  end
end
