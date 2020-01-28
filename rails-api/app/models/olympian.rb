class Olympian < ApplicationRecord
  before_validation :convert_NA_to_nil

  def convert_NA_to_nil
    self.age = age == 0 ? nil : age
    self.height = height == 0 ? nil : height
    self.weight = weight == 0 ? nil : weight
  end

  def self.index
    data = select(:id, :name, :sex, :age, :height, :weight)
    return { olympians: data }
  end
end