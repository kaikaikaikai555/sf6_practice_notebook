Rails.application.routes.draw do
  devise_for :users

  resources :character_notes do
    collection do
      get :redirect_by_opponent
    end
  end

  resources :match_logs, only: [:show, :new, :create, :destroy]

  # 💡 DefeatTagsController を使うように指定
  resources :defeat_tags, only: [] do
    collection do
      delete :destroy_multiple
      post :create_tag
    end
  end

  root "character_notes#index"
end