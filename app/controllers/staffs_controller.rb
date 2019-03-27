class StaffsController < ApplicationController
  before_action :header_menu,only: :index
  before_action :staff?
  def index
  end

  private
  def staff?
    unless user_signed_in? && current_user.staff_authority = 1
      redirect_to root_path
    end
  end
end
