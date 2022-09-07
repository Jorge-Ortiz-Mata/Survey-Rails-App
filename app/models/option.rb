class Option < ApplicationRecord
  belongs_to :question

  has_rich_text :name
end
