class Question < ApplicationRecord
  belongs_to :ingredient
  has_one :recipe, through: :ingredient
  has_one :answer

  validates :content, presence: true
end
