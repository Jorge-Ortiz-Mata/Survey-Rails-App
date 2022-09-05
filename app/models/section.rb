class Section < ApplicationRecord
  scope :grab_all_evaluations, -> { where("section_type = 1") }
  scope :grab_all_chapters, -> { where("section_type = 2") }

  belongs_to :user
  has_many :questions

  enum section_type: [:default, :evaluation, :chapter]
end
