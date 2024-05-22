Rails.application.routes.draw do
  # API routes
  resources :search_queries, only: [:create, :index]

  # Catch-all route to serve React frontend
  root to: 'public#index'
  get '*path', to: 'public#index', constraints: ->(req) { !req.xhr? && req.format.html? }
end
