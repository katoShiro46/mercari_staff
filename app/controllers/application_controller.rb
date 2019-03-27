class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :clear_flash_notice , if: :devise_controller?

private
  def after_sign_in_path_for(resource)
    flash.delete(:notice)
    users_path
  end

  def after_sign_out_path_for(resource)
    flash.delete(:notice)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:nickname, :family_name, :first_name, :family_name_phonetic, :first_name_phonetic, :birth_year, :birth_month, :birth_day,:email, :password, :password_confirmation , :payjp_id, social_profiles_attributes: [:provider, :uid])
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :payjp_id)
    end
  end

  def clear_flash_notice
    flash.delete(:alert)
  end

  def sign_in_required
    redirect_to new_user_session_url unless user_signed_in?
  end

  def header_menu
    @categories = Category.roots
    @pick_up_brands = Brand.where(pick_up:1)
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def production?
    Rails.env.production?
  end

end
