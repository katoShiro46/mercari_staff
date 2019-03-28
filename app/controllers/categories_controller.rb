class CategoriesController < ApplicationController
  before_action :header_menu,only: [:index,:show,:edit_list]

  def index
    @l_categories = Category.roots
  end

  def show
    @category = Category.find(params[:id])
    @child_categories = Category.children_of(@category).order("RAND()").limit(9)
    progeny_category = Category.subtree_of(@category)
    sold_item = Deal.pluck('item_id')
    if user_signed_in?
      my_vendor = Vendor.find_by(user_id:current_user.id)
      @items = Item.includes(:category,:vendor).where(categories:{id:progeny_category.ids}).where.not(id:sold_item).where.not(vendor_id:my_vendor.id).order(id: :DESC)
    else
      @items = Item.includes(:category).where(categories:{id:progeny_category.ids}).where.not(id:sold_item).order(id: :DESC)
    end
  end

  def edit
  end

  def update
    Category.find(params[:id]).update(category_params)
    redirect_to categoties_edit_list_staffs_path
  end

  def edit_list
    @l_categories = Category.roots
  end

  private
  def category_params
    params.require(:category).permit(:pick_up)
  end
end
