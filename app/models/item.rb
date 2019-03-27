class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :vendor
  belongs_to_active_hash :prefecture
  # belongs_to :brand
  belongs_to :size
  belongs_to :category
  has_many :item_images,dependent: :destroy
  accepts_nested_attributes_for :item_images
  has_many :item_comments,dependent: :destroy
  has_one :deal

  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :price, presence: true
  validates :condition, presence: true
  validates :shipping_fee, presence: true
  validates :shipping_date, presence: true
  validates :shipping_method, presence: true
  validates :prefecture_id, presence: true
  validates :size_id, presence: true
  validates :category_id, presence: true

  enum condition:{
    new_article: 0,
    fresh:1,
    no_dirt:2,
    little_dirt:3,
    dirt:4,
    bad_status: 5
  }
  enum shipping_fee:{
    exhibitor: 0,
    buyer: 1
  }
  enum shipping_method:{
    undecided: 0,
    mercari: 1,
    yu_mail: 2,
    letter_pack: 3,
    post: 4,
    kuroneko: 5,
    yu_pack: 6,
    click_pack: 7,
    yu_packet: 8
  }
  enum shipping_date:{
    within_2days: 0,
    within_3days: 1,
    within_7days: 2
  }
end
