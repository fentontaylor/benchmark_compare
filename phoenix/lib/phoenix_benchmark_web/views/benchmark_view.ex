defmodule PhoenixBenchmarkWeb.BenchmarkView do
	use PhoenixBenchmarkWeb, :view

	def render("welcome.json", %{data: message}) do
		message
	end

end