defmodule PhoenixBenchmarkWeb.BenchmarkView do
	use PhoenixBenchmarkWeb, :view

	def render("root.json", %{data: message}) do
		message
	end
  
	def render("index.json", %{olympians: olympians}) do
    %{olympians: render_many(olympians, PhoenixBenchmarkWeb.BenchmarkView, "olympian.json", as: :olympian)}
	end

  def render("olympian.json", %{olympian: olympian}) do
    %{
      name: olympian.name,
      sex: olympian.sex,
      age: olympian.age,
      height: olympian.height,
      weight: olympian.weight
      }
	end

end