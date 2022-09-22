class OptionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_question, only: %i[create]
  before_action :set_option, only: %i[edit update destroy]

  def edit
  end

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

  def update
    if @option.update(option_params)
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace("option_#{@option.id}",
                                                  partial: 'options/option',
                                                  locals: { option: @option }) }
      end
    end
  end

  def destroy
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove("option_#{@option.id}") }
    end
    @option.destroy
  end

  private

  def set_question
    @question = Question.find(params[:question_id])
  end

  def option_params
    params.require(:option).permit(:name)
  end

  def set_option
    @option = Option.find(params[:id])
  end
end
