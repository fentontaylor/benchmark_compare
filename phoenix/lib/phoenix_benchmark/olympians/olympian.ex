defmodule PhoenixBenchmark.Olympians.Olympian do
	use Ecto.Schema
	
	schema "olympians" do
		field :name, :string
		field :sex, :string
		field :age, :integer
		field :height, :integer
		field :weight, :integer
	end
end
