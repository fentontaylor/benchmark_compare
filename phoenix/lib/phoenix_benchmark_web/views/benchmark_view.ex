defmodule PhoenixBenchmarkWeb.BenchmarkView do
	use PhoenixBenchmarkWeb, :view

	def render("root.json", %{data: message}) do
		message
	end

end