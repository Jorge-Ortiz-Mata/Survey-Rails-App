class OptionsController < ApplicationController
  before_action :set_question, only: %i[create]

  def create
    @option = @question.options.new(option_params)

    if @option.save
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.append("question_#{@question.id}_options", 
                                                  partial: 'options/option', 
                                                  locals: { option: @option }) }
      end
    else
      format.html { render :new, status: :unprocessable_entity }
    end
  end

  private

  def set_question
    @question = Question.find(params[:question_id])
  end

  def option_params
    params.require(:option).permit(:name)
  end
end
