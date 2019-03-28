class ItemListController < ApplicationController
  before_action :staff?
  before_action :header_menu

  def index
    @items = Item.all
  end

  def search
  end


  def export
  end
end
