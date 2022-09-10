class SurveySectionsController < ApplicationController
  before_action :set_survey, only: %i[add_sections save_sections]
  
  def add_sections
  end

  def save_sections
    puts "---"
    puts "---"
    puts params
    print params[:sections][:ids]
    puts "---"
    puts "---"
  end

  private

  def set_survey
    @survey = Survey.find(params[:survey_id])
  end

end
