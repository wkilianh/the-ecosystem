class MessagesController < ApplicationController

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = Message.new(message_params)
    @message.conversation = @conversation
    @message.user = current_user
    authorize @message
    if current_user == @conversation.sender && @conversation.receiver.conversation_channel != @conversation.id
      @conversation.receiver_notifications += 1
      @conversation.save
      ConversationNotificationChannel.broadcast_to(
        @conversation,
        "#{@conversation.sender.nickname}"
      )
    elsif current_user == @conversation.receiver && @conversation.sender.conversation_channel != @conversation.id
      @conversation.sender_notifications += 1
      @conversation.save
      ConversationNotificationChannel.broadcast_to(
        @conversation,
        "#{@conversation.receiver.nickname}"
      )
    end
    # @conversation.save
    

    if @message.save
      ConversationChannel.broadcast_to(
        @conversation,
        render_to_string(partial: "message", locals: { message: @message })
      )
      # redirect_to conversations_path( anchor: "message-#{@message.id}")
    else
      render "conversations/"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
