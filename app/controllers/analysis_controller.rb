class AnalysisController < ApplicationController
  before_action :header_menu,:staff?
  def index
    # TODO  共通メソッド化する必要あり！
    # 初回表示時点での初期値の設定
    @check_category = true  unless params[:option_1]
    @check_count    = true  unless params[:option_2]
    @check_all      = true  unless params[:option_3]
    # option_1の機能未実装のため、強制的に@check_categoryをtrueとする
    @check_category = true
    count = []
    price = []
    sell_count = []
    sell_price = []
    # if params[:content] == "category"
      # カテゴリーごとの検索の場合
      if params[:option_l_category].present?
        @select_categories = Category.children_of(params[:option_l_category])
      else
        @select_categories = Category.roots
        # @select_categories = Category.children_of(params[:option_category])
      end
      # カテゴリーごとの名称を取得
      @labels_names = @select_categories.map{|category| category[:name]}
      gon.labels_names = @labels_names
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
      if params[:option_2] == "price"
        @check_price = true
        # gon.data = price
        # gon.label = "出品金額"
        @data = price
        @label = "出品金額"
      else
        @check_count = true
        # gon.data = count
        # gon.label = "出品数"
        @data = count
        @label = "出品数"
      end
      gon.data = @data
      gon.label = @label
      # gon.title = "全カテゴリー"
      @title = "全カテゴリー"
      gon.title = @title
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
    # gon.jbuilder
    respond_to do |format|
      format.html
      format.json {gon.jbuilder}
    end
  end
end
