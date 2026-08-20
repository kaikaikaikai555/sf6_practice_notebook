Rails.application.routes.draw do
  get "match_logs/index"
  get "match_logs/new"
  get "match_logs/create"
  get "character_notes/index"
  get "character_notes/new"
  get "character_notes/create"
  get "character_notes/show"
  get "character_notes/edit"
  get "character_notes/update"
  get "character_notes/destroy"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
