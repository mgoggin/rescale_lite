class Answer < ApplicationRecord
  belongs_to :question
  has_one :ingredient, through: :question

  validates :content, presence: true
end
