defmodule PhoenixBenchmarkWeb.BenchmarkController do
	use PhoenixBenchmarkWeb, :controller

	def root(conn, _params) do
		render conn, "root.json", data: %{message: "Hello, World!"}
	end
end