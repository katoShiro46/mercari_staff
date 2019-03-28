module CategoriesHelper
  def child_category_define(parent)
    @children_categories = Category.children_of(parent)
  end
end
