class SurveySectionsController < ApplicationController
  before_action :set_survey, only: %i[add_sections save_sections delete_section up_section down_section]
  
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
    SurveySection.reorder_objects(@survey.id)

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove("#{params[:id]}") }
    end
  end

  def up_section
    @survey_section = SurveySection.where(survey_id: @survey.id).find_by(section_id: params[:id])
    @prev_surv_sec = SurveySection.where(survey_id: @survey.id).find_by(order: @survey_section.order - 1)
    @survey_section.update!(order: @survey_section.order - 1)
    @prev_surv_sec.update!(order: @prev_surv_sec.order + 1)

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace('sections', 
                                                partial: 'survey_sections/survey_sections', 
                                                locals: { survey: Survey.find(@survey.id) }) }
    end
  end

  def down_section
    @survey_section = SurveySection.where(survey_id: @survey.id).find_by(section_id: params[:id])
    @next_surv_sec = SurveySection.where(survey_id: @survey.id).find_by(order: @survey_section.order + 1)
    @survey_section.update!(order: @survey_section.order + 1)
    @next_surv_sec.update!(order: @next_surv_sec.order - 1)

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
