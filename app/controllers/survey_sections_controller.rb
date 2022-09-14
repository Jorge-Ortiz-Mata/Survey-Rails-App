class SurveySectionsController < ApplicationController
  before_action :set_survey
  before_action :set_survey_section, except: %i[add_sections save_sections]

  def add_sections; end

  def save_sections
    ids = params[:sections][:ids].reject { |id| id.empty? }
    new_ids = SurveySection.check_no_repeat_records(@survey, ids, [])

    return if new_ids.empty?

    new_ids.each do |id|
      @survey_section = SurveySection.new(survey_id: @survey.id, section_id: id)
      @survey_section.save
    end
    set_turbo_stream
  end

  def delete_section
    @survey_section.destroy
    SurveySection.reorder_objects(@survey.id)

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove("#{params[:id]}") }
    end
  end

  def up_section
    @prev_surv_sec = SurveySection.grab_objects(@survey.id).find_by(order: @survey_section.order - 1)
    @survey_section.update!(order: @survey_section.order - 1)
    @prev_surv_sec.update!(order: @prev_surv_sec.order + 1)
    set_turbo_stream
  end

  def down_section
    @next_surv_sec = SurveySection.grab_objects(@survey.id).find_by(order: @survey_section.order + 1)
    @survey_section.update!(order: @survey_section.order + 1)
    @next_surv_sec.update!(order: @next_surv_sec.order - 1)
    set_turbo_stream
  end

  private

  def set_survey
    @survey = Survey.find(params[:survey_id])
  end

  def set_turbo_stream
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace('sections',
                                                partial: 'survey_sections/survey_sections',
                                                locals: { survey: Survey.find(@survey.id) }) }
    end
  end

  def set_survey_section
    @survey_section = SurveySection.grab_record(@survey.id, params[:id])
  end
end
