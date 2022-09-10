class SurveySectionsController < ApplicationController
  before_action :set_survey, only: %i[add_sections save_sections]
  
  def add_sections
  end

  def save_sections
    ids = params[:sections][:ids].reject { |id| id.empty? }
    new_ids = SurveySection.check_no_repeat_records(@survey, ids, [])
    puts "---"
    print ids
    puts "-"
    print new_ids
    puts "---"
  end

  private

  def set_survey
    @survey = Survey.find(params[:survey_id])
  end

end
