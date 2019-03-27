class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    callback_from :facebook
  end

  def google_oauth2
    callback_from :google
  end

  private
  def callback_from(provider)
    provider = provider.to_s
    @user = User.joins(:social_profiles).find_for_oauth_about_user(request.env['omniauth.auth'])
    if @user.persisted?  # ユーザーがデータベース上に存在している。
      sign_in_and_redirect @user, event: :authentication  # ユーザーをsign_inする
      set_flash_message(:notice, :success, kind: __callee__.to_s.capitalize) if is_navigational_format?
    else  # 何らかの理由でデータベースに保存されていない。
      @user.errors.clear
      @user.social_profiles.new(uid: request.env['omniauth.auth'].uid, provider: request.env['omniauth.auth'].provider)
      render 'users/registrations/new'
    end
  end
end
