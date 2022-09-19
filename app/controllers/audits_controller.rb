class AuditsController < ApplicationController
  layout "audits"
  before_action :set_survey, only: %i[index]

  def index
    @step = params[:step].to_i
  end

  private

  def set_survey
    @survey = Survey.find_by(uuid: params[:id])
    redirect_to root_path if @survey.nil?
  end
end
