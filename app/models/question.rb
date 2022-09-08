class Question < ApplicationRecord
  belongs_to :section

  has_many :options, dependent: :destroy

  enum question_type: [:default, :text_free, :multiple, :level]
end
