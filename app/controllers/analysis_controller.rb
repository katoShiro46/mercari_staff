class AnalysisController < ApplicationController
  before_action :header_menu,:staff?
  def index
    # カテゴリーごとの検索の場合
    @l_categories = Category.roots
    # カテゴリーごとの名称を取得
    gon.category_names = @l_categories.map{|category| category[:name]}
    # カテゴリーごとのアイテム数,合計金額を取得
    count = []
    price = []
    sell_count = []
    sell_price = []
    @l_categories.each do |category|
      progeny_category = Category.subtree_of(category)
      items = Item.includes(:category).where(categories:{id:progeny_category.ids})
      count << items.count
      price << items.map{|category| category[:price]}.sum
    end
    gon.category_count = count
    gon.category_price = price

    # ユーザーごとの検索の場合
    # ブランドごとの検索の場合
  end
end
