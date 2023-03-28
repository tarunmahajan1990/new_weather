# config/routes.rb
Rails.application.routes.draw do
  root to: 'weather#index'
  get 'weather/forecast'
  post 'weather/forecast', to: 'weather#forecast'
end

