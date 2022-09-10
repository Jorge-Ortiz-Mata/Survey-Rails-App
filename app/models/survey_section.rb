class SurveySection < ApplicationRecord
  belongs_to :survey
  belongs_to :section


  private

  def self.check_no_repeat_records(survey, ids, new_ids)
    survey_sections = where(survey_id: survey.id)

    ids.each { |id| new_ids << id.to_i unless survey_sections.find_by(section_id: id).present? } 
    new_ids
  end
end
