require 'rails_helper'

describe 'Olympian', type: :model do
  it 'can initialize' do
    olympian = Olympian.new
    expect(olympian).to be_instance_of(Olympian)
  end
  # describe 'validations' do
  #   it { should validate_presence_of :name }
  # end
end