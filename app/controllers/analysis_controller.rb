class AnalysisController < ApplicationController
  before_action :header_menu,:staff?
  def index
    # TODO  共通メソッド化する必要あり！
    @check_category = true
    count = []
    price = []
    sell_count = []
    sell_price = []
    # if params[:content] == "category"
      # カテゴリーごとの検索の場合
      @select_categories = Category.roots
      # カテゴリーごとの名称を取得
      gon.labels_names = @select_categories.map{|category| category[:name]}
      # カテゴリーごとのアイテム数,合計金額を取得
      @select_categories.each do |category|
        progeny_category = Category.subtree_of(category)
        items = Item.includes(:category).where(categories:{id:progeny_category.ids})
        sold_item = Deal.pluck('item_id')
        if params[:option_3] == "sell"
          items = items.where.not(id:sold_item)
          @check_sell = true
        elsif params[:option_3] == "sold"
          items = items.where(id:sold_item)
          @check_sold = true
        else
          @check_all = true
        end
        count << items.count
        price << items.map{|category| category[:price]}.sum
      end
      if params[:option_2] == "count"
        @check_count = true
        gon.data = count
        gon.label = "出品数"
      elsif params[:option_2] == "price"
        @check_price = true
        gon.data = price
        gon.label = "出品金額"
        params[:option_2] = true
      end
      gon.title = "全カテゴリー"
    # else params[:content] == "user"
    #   # ベンダーごとの検索の場合
    #   @select_categories = Vendor.all
    #   gon.category_names = @select_categories.map{|category| category.user[:nickname]}
    #   @select_categories.each do |category|
    #     items = Item.includes(:vendor).where(vendor_id:category.id)
    #     count << items.count
    #     price << items.map{|category| category[:price]}.sum
    #   end
    #   gon.category_count = count
    #   gon.category_price = price
    #   gon.category_label = "出品数"
    #   gon.category_title = "全ユーザー"
    #   # ブランドごとの検索の場合
    # end
  end

  def search
    # カテゴリーごとの検索の場合
    @select_categories = Category.children_of(params[:category])
    # カテゴリーごとの名称を取得
    gon.category_names = @select_categories.map{|category| category[:name]}
    # カテゴリーごとのアイテム数,合計金額を取得
    count = []
    price = []
    sell_count = []
    sell_price = []
    @select_categories.each do |category|
      progeny_category = Category.subtree_of(category)
      items = Item.includes(:category).where(categories:{id:progeny_category.ids})
      count << items.count
      price << items.map{|category| category[:price]}.sum
    end
    gon.category_count = count
    gon.category_price = price
    gon.category_label = "出品数"
    gon.category_title = Category.find(params[:category]).name

    # respond_to do |format|
    #   format.html
    #   format.json
    # end
    render "index"
  end
end
