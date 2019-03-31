module AnalysisHelper
  def item_count(category)
    progeny_category = Category.subtree_of(category)
    items = Item.includes(:category).where(categories:{id:progeny_category.ids})
    count = items.count
    return count
  end
end
