defmodule PhoenixBenchmark.Olympians.Olympian do
	use Ecto.Schema
	import Ecto.Changeset
	
	schema "olympians" do
		field :name, :string
		field :sex, :string
		field :age, :integer
		field :height, :integer
		field :weight, :integer
	end
  
	def changeset(struct, params \\ %{}) do
	  struct
	  |> cast(params, [:name, :sex, :age, :height, :weight])
	end
end