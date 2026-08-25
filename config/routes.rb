Rails.application.routes.draw do
  root "character_notes#index"

  resources :character_notes do
    collection do
      get :redirect_by_opponent
    end
  end

  resources :match_logs
end