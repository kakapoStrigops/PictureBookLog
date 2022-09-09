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
    resources :books, only: [:new, :index]
  end


  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
  }

  namespace :admin do
    get '/' => "homes#top"
  end

end
