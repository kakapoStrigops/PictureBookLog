Rails.application.routes.draw do

  # 会員用
  devise_for :members,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: "public/sessions"
  }

  scope module: :public do
    root "homes#top"
    get "/about"=>"homes#about"
    resources :members, only: [:show, :edit, :update, :index]
    get "books/search" => "books#search"
    resources :candidate_posts, only: [:create, :index, :update]
    # resources :reviews, only: [:new, :create, :index, :show, :edit, :update]
    resources :reviews, only: [:create, :index, :show, :edit, :update, :destroy] do
      member do
        get 'new', as: 'new'
        patch 'post', as: 'post'
      end
    end
    resources :comments, only: [:new, :create, :edit, :update]
  end


  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
  }

  namespace :admin do
    get '/' => "homes#top"
    resources :members, only: [:index, :show, :edit, :update]
    resources :reviews, only: [:index, :show, :edit, :update]
    resources :tags, only: [:index]
    resources :genre_tags, only: [:new, :create, :edit, :update]
    resources :target_age_tags, only: [:new, :create, :edit, :update]
  end

end
