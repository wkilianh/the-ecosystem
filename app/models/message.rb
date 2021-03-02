class Message < ApplicationRecord
  belongs_to :conversation
  # belongs_to :user
  # belongs_to :conversation, through: :user

  # belongs_to :user, through: :conversation
end
