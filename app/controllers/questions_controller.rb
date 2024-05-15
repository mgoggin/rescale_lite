class QuestionsController < ApplicationController
  before_action :set_ingredient

  # GET /questions/new
  def new
    @question = @ingredient.questions.new
  end

  # POST /questions or /questions.json
  def create
    @question = @ingredient.questions.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to recipe_path(@question.recipe), notice: "Question was successfully created." }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_ingredient
      @ingredient = Ingredient.find(params[:ingredient_id])
    end

    # Only allow a list of trusted parameters through.
    def question_params
      params.require(:question).permit(:content)
    end
end
