Rails.application.routes.draw do
  get '/', to: 'hello#index'
  namespace :api do
    namespace :v1 do
      resources :olympians, only: [:index]
    end
  end
end
