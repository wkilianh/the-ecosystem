class ConversationsController < ApplicationController
  def create
  end

  def index
    @conversations = policy_scope(Conversation)
    @message = Message.new
    # authorize @message
  end

  def show
    @conversation = Conversation.find(params[:id])
    @message = Message.new
    authorize @conversation
    # authorize @messages
  end

  def destroy
  end
end
