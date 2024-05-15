class Question < ApplicationRecord
  belongs_to :ingredient
  has_one :recipe, through: :ingredient

  validates :content, presence: true
end
