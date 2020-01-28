class OlympiansSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :name, :sex, :age, :height, :weight
end