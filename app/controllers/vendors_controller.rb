class VendorsController < ApplicationController
  before_action :header_menu,only: [:edit]
  before_action :authenticate_user!, only: [:new, :index]
  add_breadcrumb 'メルカリ', :root_path
  add_breadcrumb 'マイページ', :users_path


  def new
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.new(create_params)
    if @vendor.save
      redirect_to "/users/registrations/card/new"
    else
      render action: 'new'
    end
  end

  def edit
    vendor = Vendor.find_by(user_id: current_user.id)
    if vendor
      @vendor = vendor
    else
      @vendor = Vendor.new
    end
    add_breadcrumb '発送元・お届け先住所変更', :edit_vendor_path
  end

  def update
    if Vendor.update(create_params)
      redirect_to users_path
    else
      render action: 'edit',notice: '記述内容に不備があります'
    end
  end

  private
  def create_params
    params.require(:vendor).permit(:post_number, :prefecture_id, :city, :address, :building_name, :family_name,:first_name, :first_name_phonetic, :family_name_phonetic).merge(user_id: current_user.id)
  end
end
