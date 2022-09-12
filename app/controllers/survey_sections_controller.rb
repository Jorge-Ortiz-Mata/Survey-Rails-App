class SurveySectionsController < ApplicationController
  before_action :set_survey, only: %i[add_sections save_sections delete_section]
  
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

  def delete_section
    @survey_section = SurveySection.where(survey_id: @survey.id).find_by(section_id: params[:id])
    @survey_section.destroy

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove("#{params[:id]}") }
    end
  end

  private

  def set_survey
    @survey = Survey.find(params[:survey_id])
  end

end
