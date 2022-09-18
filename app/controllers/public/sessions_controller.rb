# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  before_action :member_state, only: [:create]

  # ゲストログイン機能
  def guest_sign_in
    member = Member.guest
    sign_in member
    redirect_to member_path(member), notice: 'ゲスト会員でログインしました。'
  end

  def after_sign_in_path_for(resource)
    member_path(current_member.id)
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def member_state
    ## 【処理内容1】 入力されたemailからアカウントを1件取得
    @member = Member.find_by(email: params[:member][:email])
    ## アカウントを取得できなかった場合、このメソッドを終了する
    return if !@member
    ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるか、かつ、有効会員かを判別
    if @member.valid_password?(params[:member][:password]) && !@member.delete_status
        redirect_to new_member_session_path
    end
  end

end
