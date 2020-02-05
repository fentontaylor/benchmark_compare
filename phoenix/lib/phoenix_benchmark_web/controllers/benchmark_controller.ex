defmodule PhoenixBenchmarkWeb.BenchmarkController do
	use PhoenixBenchmarkWeb, :controller
	alias PhoenixBenchmark.Olympians.Olympians

	def root(conn, _params) do
		json(conn, %{message: "Hello, World!"})
	end

	def olympians(conn, _params) do
		json(conn, %{olympians: Olympians.all})
	end
end