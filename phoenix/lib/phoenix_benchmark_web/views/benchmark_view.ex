defmodule PhoenixBenchmarkWeb.BenchmarkView do
	use PhoenixBenchmarkWeb, :view

	def render("welcome.json", %{data: message}) do
    render_one(message, PhoenixBenchmarkWeb.BenchmarkView, "message.json")
	end
	
	def render("message.json", message) do
    message.benchmark
  end
end