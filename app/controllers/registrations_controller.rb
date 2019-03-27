class RegistrationsController < Devise::RegistrationsController

  before_action :header_menu,only: [:edit,:new]

  def new
    super
  end

  def create
    prevent_password_nil if params[:user][:social_profiles_attributes]
    # ommniauthを利用した場合にパスワードが空だとcreateの際のdevise側のバリデーションにひかかるため、一意的なパスワードを代入している
    super
  end

  def done
  end

  def edit
    @user = current_user
    super
  end

  def update
    super
  end

  private
  def after_sign_up_path_for(resource)
    flash.delete(:notice)
    new_vendor_path
  end

  def prevent_password_nil
    params[:user][:password] = params[:user][:password_confirmation] = "#{params[:user][:social_profiles_attributes]['0'][:provider]}#{params[:user][:social_profiles_attributes]['0'][:uid]}"
  end

end
