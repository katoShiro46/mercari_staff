class Category < ApplicationRecord
  has_many :items
  belongs_to :size_type
  has_ancestry
end
