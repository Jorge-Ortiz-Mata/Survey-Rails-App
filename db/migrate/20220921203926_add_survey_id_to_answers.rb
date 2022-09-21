class AddSurveyIdToAnswers < ActiveRecord::Migration[7.0]
  def change
    add_reference(:answers, :survey, foreign_key: true, null: :false)
  end
end
