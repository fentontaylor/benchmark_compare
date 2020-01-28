FactoryBot.define do
  gender = ['M', 'F'].sample
  first_name = gender == 'M' ? Faker::Name.male_first_name : Faker::Name.female_first_name
  factory :olympian do
    name { first_name + ' ' + Faker::Name.last_name }
    sex { gender }
    age { (16..35).to_a.sample }
    height { (150..200).to_a.sample }
    weight { (40..115).to_a.sample }
  end
end