class Section < ApplicationRecord
  belongs_to :user

  enum section_type: [:default, :evaluation, :chapter]
end
