defmodule PhoenixBenchmark.Olympians.Olympian do
	use Ecto.Schema
	@derive {Jason.Encoder, only: [:id, :name, :sex, :age, :height, :weight]}
	
	schema "olympians" do
		field :name, :string
		field :sex, :string
		field :age, :integer
		field :height, :integer
		field :weight, :integer
	end
end
