class MessagesController < ApplicationController

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = Message.new(message_params)
    @message.conversation = @conversation
    @message.user = current_user
    authorize @message
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
