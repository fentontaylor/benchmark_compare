FactoryBot.define do
  factory :olympian do
    name { "Bob" }
    last_name { ('A'..'Z').to_a.sample + '.' }
  end
end