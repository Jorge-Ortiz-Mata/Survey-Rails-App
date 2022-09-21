class Log < ApplicationRecord
  has_secure_token :token, length: 50
  belongs_to :survey

  enum status: [ :default, :sent, :process, :finish ]
end
