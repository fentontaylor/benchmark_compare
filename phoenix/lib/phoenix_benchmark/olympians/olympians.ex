defmodule PhoenixBenchmark.Olympians.Olympians do
	import Ecto.Query, warn: false

  alias PhoenixBenchmark.Repo
	alias PhoenixBenchmark.Olympians.Olympian
	
	def all do
		Repo.all(Olympian)
	end
end