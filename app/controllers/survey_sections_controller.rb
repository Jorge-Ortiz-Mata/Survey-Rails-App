class SurveySectionsController < ApplicationController
  before_action :set_survey, only: %i[add_sections save_sections]
  
  def add_sections
  end

  def save_sections
    ids = params[:sections][:ids].reject { |id| id.empty? }
    new_ids = SurveySection.check_no_repeat_records(@survey, ids, [])

    return if new_ids.empty?

    new_ids.each do |id|
      @survey_section = SurveySection.new(survey_id: @survey.id, section_id: id)
      @survey_section.save
    end

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace('sections', 
                                                partial: 'survey_sections/survey_sections', 
                                                locals: { survey: Survey.find(@survey.id) }) }
    end
  end

  private

  def set_survey
    @survey = Survey.find(params[:survey_id])
  end

end
