Rails.application.routes.draw do

  namespace :public do
    get 'members/show'
    get 'members/edit'
    get 'members/update'
    get 'members/index'
  end
  # 会員用（登録・ログイン）
  devise_for :members,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: "public/sessions"
  }

  # 管理者用　（ログイン）
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
  }


  scope module: :public do
    root :to =>"homes#top"
    get "/about"=>"homes#about"
  end

  namespace :admin do
    get '/' => "homes#top"
  end

end
