class Api::V1::OlympiansController < ApplicationController
  def index
    olympians = Olympian.all
    render json: OlympiansSerializer.new(olympians)
  end
end