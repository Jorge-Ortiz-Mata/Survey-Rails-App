class SurveySection < ApplicationRecord
  belongs_to :survey
  belongs_to :section
end
