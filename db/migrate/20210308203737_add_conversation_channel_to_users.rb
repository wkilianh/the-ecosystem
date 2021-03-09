class AddConversationChannelToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :conversation_channel, :bigint, default: 0
  end
end
