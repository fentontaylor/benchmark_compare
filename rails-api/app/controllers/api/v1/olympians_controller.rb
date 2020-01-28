class Api::V1::OlympiansController < ApplicationController
  def index
    render json: Olympian.index
  end
end