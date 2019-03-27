module ItemsHelper
  def select_items(selected_category,category)
    if selected_category.include?(category)
      category = Category.descendants_of(category)
      sold_item = Deal.pluck('item_id')
      @items = Item.includes(:category).where(categories:{id:category.ids}).where.not(id:sold_item).order(id: :DESC).limit(4 )
    else
      @items = Item.where(brand:category.name).order(id: :DESC).limit(4)
      # ちゃんとitemとbrandが紐づいている場合はこれ
      # @items = Item.includes(:brand).where(brands:{name:category.name}).limit(4)
    end
  end

  def children_category_define(parent_category)
    @categories = Category.children_of(parent_category)
  end
end
