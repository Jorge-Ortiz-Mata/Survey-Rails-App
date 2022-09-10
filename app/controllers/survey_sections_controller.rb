class SurveySectionsController < ApplicationController
  before_action :set_survey, only: %i[add_sections]
  
  def add_sections
  end

  private

  def set_survey
    @survey = Survey.find(params[:survey_id])
  end

end
