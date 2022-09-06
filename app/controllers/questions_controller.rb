class QuestionsController < ApplicationController
  before_action :set_evaluation, only: %i[create]
  before_action :set_question, only: %i[edit]

  def edit
  end
  
  def create
    @question = @evaluation.questions.build(question_params)

    if @question.save
      respond_to do |format|
          format.turbo_stream { render turbo_stream: turbo_stream.replace('questions_all', 
                                                    partial: 'questions/questions', 
                                                    locals: { evaluation: @evaluation }) }
      end
    else
      format.html { render :new, status: :unprocessable_entity }
    end
  end

  def update
  end

  def destroy
  end

  private

    def set_evaluation
      @evaluation = Section.find(params[:section_id])
    end

    def question_params
      params.require(:question).permit(:name, :question_type)
    end

    def set_question
      @question = Question.find(params[:id])
    end
end
