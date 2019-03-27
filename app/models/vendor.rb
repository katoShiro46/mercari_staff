class Vendor < ActiveRecord::Base
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :prefecture
  belongs_to :user
  has_many :items
  has_many :valuations
  has_many :deals

  validates :family_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/i }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/i }
  validates :prefecture_id, presence: true
  validates :city, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥ー]+\z/i }
  validates :address, presence: true
  validates :post_number, numericality: { only_integer: true }
  # validates :nickname, presence: true
  # validates :family_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/i }
  # validates :first_name, presence: true,  format: { with: /\A[ぁ-んァ-ン一-龥]+\z/i }
  # validates :family_name_phonetic, presence: true, format: {with: /\A[ア-ン゛゜ァ-ォャ-ョー「」、]+\z/}
  # validates :first_name_phonetic, presence: true, format: {with: /\A[ア-ン゛゜ァ-ォャ-ョー「」、]+\z/}
  # validates :birth_year, presence: true,format: {with: /\A[0-9]+\z/}
  # validates :birth_month, presence: true,format: {with: /\A[0-9]+\z/}
  # validates :birth_day, presence: true,format: {with: /\A[0-9]+\z/}
end
