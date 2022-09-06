class Question < ApplicationRecord
  belongs_to :section

  enum question_type: [:default, :text_free, :multiple, :level]
end
