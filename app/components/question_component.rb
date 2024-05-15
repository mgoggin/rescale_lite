# frozen_string_literal: true

class QuestionComponent < ViewComponent::Base
  def initialize(question:, answerable: false)
    @question = question
    @answerable = answerable
  end

  def answerable?
    @question.answer.blank? && @answerable
  end
end
