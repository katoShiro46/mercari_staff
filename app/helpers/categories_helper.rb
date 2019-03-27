module CategoriesHelper
  def children_category_define(parent)
    @children_categories = Category.children_of(parent)
  end
end
