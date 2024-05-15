class AnswersController < ApplicationController
  before_action :set_question

  # GET /answers/new
  def new
    @answer = @question.build_answer
  end

  # POST /answers or /answers.json
  def create
    @answer = @question.build_answer(answer_params)

    respond_to do |format|
      if @answer.save
        format.html { redirect_to recipe_url(@question.recipe), notice: "Answer was successfully created." }
        format.json { render :show, status: :created, location: @answer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:question_id])
    end

    # Only allow a list of trusted parameters through.
    def answer_params
      params.require(:answer).permit(:content)
    end
end
