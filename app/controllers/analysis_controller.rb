class AnalysisController < ApplicationController
  before_action :header_menu,:staff?
  def index
    # カテゴリーごとの検索の場合
    @select_categories = Category.roots
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
    gon.category_title = "全カテゴリー"

    # ユーザーごとの検索の場合
    # ブランドごとの検索の場合
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

    respond_to do |format|
      format.html
      format.json
    end
    render "index"
  end
end
