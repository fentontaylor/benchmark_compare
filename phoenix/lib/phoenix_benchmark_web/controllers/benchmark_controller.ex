defmodule PhoenixBenchmarkWeb.BenchmarkController do
	use PhoenixBenchmarkWeb, :controller
	alias PhoenixBenchmark.Olympians.Olympians

	def root(conn, _params) do
		render conn, "root.json", data: %{message: "Hello, World!"}
	end

	def olympians(conn, _params) do
		render conn, "index.json", olympians: Olympians.all
	end
end