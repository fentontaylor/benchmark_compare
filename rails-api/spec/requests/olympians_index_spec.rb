require 'rails_helper'

describe 'GET api/v1/olympians' do
  it 'returns an index of all olympians' do
    oly1, oly2 = create(:olympian), create(:olympian)

    get '/api/v1/olympians'

    expect(response.status).to eq(200)

    data = JSON.parse(response.body, symbolize_names: true)

    expected = { 
      olympians: [
        {
          id: oly1.id,
          name: oly1.name,
          sex: oly1.sex,
          age: oly1.age,
          height: oly1.height,
          weight: oly1.weight
        },
        {
          id: oly2.id,
          name: oly2.name,
          sex: oly2.sex,
          age: oly2.age,
          height: oly2.height,
          weight: oly2.weight
        }
      ]
    }

    expect(data).to eq(expected)
  end
end