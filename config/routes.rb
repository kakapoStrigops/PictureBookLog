Rails.application.routes.draw do

  # 会員用
  devise_for :members,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: "public/sessions"
  }

    # ゲストログイン用
    devise_scope :member do
      post 'members/guest_sign_in', to: 'public/sessions#guest_sign_in'
    end

  scope module: :public do
    root "homes#top"
    get "/about"=>"homes#about"
    resources :members, only: [:show, :edit, :update, :index]
    get "books/search" => "books#search"
    resources :candidate_posts, only: [:create, :index, :update, :destroy]
    resources :reviews, only: [:create, :index, :show, :edit, :update, :destroy] do
      member do
        get 'new', as: 'new'
        patch 'post', as: 'post'
      end
      resources :comments, only: [:create, :destroy]
    end
  end


  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
  }

  namespace :admin do
    get '/' => "homes#top"
    resources :members, only: [:index, :show, :edit, :update]
    resources :reviews, only: [:index, :show, :edit, :update] do
      resources :comments, only: [:edit, :update]
    end
    resources :tags, only: [:index]
    resources :genre_tags, only: [:create, :edit, :update, :destroy]
    resources :target_age_tags, only: [:create, :edit, :update, :destroy]
  end

end