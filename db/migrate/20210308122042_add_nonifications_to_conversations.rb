class AddNonificationsToConversations < ActiveRecord::Migration[6.0]
  def change
    add_column :conversations, :sender_notifications, :bigint, default: 0
    add_column :conversations, :receiver_notifications, :bigint, default: 0
  end
end
