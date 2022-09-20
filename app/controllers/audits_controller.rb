class AuditsController < ApplicationController
  layout "audits"
  before_action :set_survey, only: %i[index]

  def index
    @token = params[:token_id]
    @step = params[:step].to_i
  end

  def save_answers
    @ids = params[:question][:ids]

    @ids.each do |key, value|

      if value.present?
        @answer = Answer.new(name: value, question_id: key, user_token: params[:user_token])
        @answer.save
      end

    end
  end

  private

  def set_survey
    @survey = Survey.find_by(uuid: params[:id])
    redirect_to root_path if @survey.nil?
  end
end
