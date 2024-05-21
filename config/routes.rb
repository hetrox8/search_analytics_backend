# config/routes.rb
Rails.application.routes.draw do
  resources :search_queries, only: [:create, :index]
end
