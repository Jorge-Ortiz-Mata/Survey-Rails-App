class Survey < ApplicationRecord
  belongs_to :user

  has_one_attached :avatar, dependent: :destroy
end
