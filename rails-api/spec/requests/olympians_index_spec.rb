require 'rails_helper'

describe 'GET api/v1/olympians' do
  it 'returns an index of all olympians' do
    oly1, oly2 = create(:olympian), create(:olympian)

    get '/api/v1/olympians'

    expect(response.status).to eq(200)

    data = JSON.parse(response.body, symbolize_names: true)

    expect(data).to eq([oly1, oly2])
  end
end