Rails.application.routes.draw do

  # 会員用（登録・ログイン）
  devise_for :members,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: "public/sessions"
  }

  # 管理者用　（ログイン）
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
  }

end
