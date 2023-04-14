class Recipe < ApplicationRecord
  validates :title, presence: true
  validates :ingredient, presence: true
  validates :cooking_instructions, presence: true
  validates :time_tiken, presence: true, numericality: { greater_than: 0 }
  validates :cuisine_type, presence: true

  has_one_attached :recipe_image, dependent: :destroy
end
