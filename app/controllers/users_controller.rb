class UsersController < ApplicationController
  before_action :header_menu,only: [:index,:edit,:index,:logout]
  before_action :authenticate_user!, only: :index
  add_breadcrumb 'メルカリ', :root_path
  add_breadcrumb 'マイページ', :users_path

  def index
  end

  def edit
    @user = current_user
    add_breadcrumb 'プロフィール', :edit_user_path
  end

  def update
    if User.update(update_params)
      redirect_to users_path
    else
      renderb:edit
    end
  end

  def logout
    add_breadcrumb 'ログアウト', :logout_users_path
  end

  private
  def update_params
    params.require(:user).permit(:nickname, :profile, :icon)
  end
end
