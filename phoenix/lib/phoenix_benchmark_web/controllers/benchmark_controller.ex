defmodule PhoenixBenchmarkWeb.BenchmarkController do
	use PhoenixBenchmarkWeb, :controller

	def welcome(conn, _params) do
		render conn, "welcome.json", data: %{message: "Hello, World!"}
	end
end