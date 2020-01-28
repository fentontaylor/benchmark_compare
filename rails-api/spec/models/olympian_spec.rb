require 'rails_helper'

describe 'Olympian', type: :model do
  it 'attributes' do
    bob = Olympian.create(
      name: 'Bob',
      sex: 'M',
      age: 25,
      height: 170,
      weight: 65  
    )
    expect(bob).to be_instance_of(Olympian)
    expect(bob.name).to eq('Bob')
    expect(bob.sex).to eq('M')
    expect(bob.age).to eq(25)
    expect(bob.height).to eq(170)
    expect(bob.weight).to eq(65)
  end

  it 'cannot have blank name' do
    expect { Olympian.create(
      sex: 'M',
      age: 25,
      height: 170,
      weight: 65  
    )}.to raise_error(ActiveRecord::NotNullViolation)
  end

  it 'can have nil values for everything but name' do
    bob = Olympian.create(
      name: 'Bob'
    )
    expect(bob).to be_instance_of(Olympian)
    expect(bob.name).to eq('Bob')
    expect(bob.sex).to be_nil
    expect(bob.age).to be_nil
    expect(bob.height).to be_nil
    expect(bob.weight).to be_nil
  end

  it 'converts "NA" to nil for height, weight, age' do
    bob = Olympian.create(
      name: 'Bob',
      sex: 'NA',
      age: 'NA',
      height: 'NA',
      weight: 'NA'  
    )
    expect(bob.age).to be_nil
    expect(bob.height).to be_nil
    expect(bob.weight).to be_nil
  end
end