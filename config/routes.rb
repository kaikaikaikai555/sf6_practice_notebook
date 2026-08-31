Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  resources :character_notes do
    collection do
      get :redirect_by_opponent
    end
  end

  resources :match_logs, only: [:show, :new, :create, :destroy]

  resources :defeat_tags, only: [] do
    collection do
      delete :destroy_multiple
      post :create_tag
    end
  end

  root "character_notes#index"
end