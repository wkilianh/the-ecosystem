class ConversationNotificationChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    conversation = Conversation.find(params[:id])
    # if conversation.sender == current_user
      stream_for conversation
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
