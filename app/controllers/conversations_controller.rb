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
    ################# for unseen notifications #################
    # if @conversation.sender == current_user
    #   receiver_unseen_msgs = conversation.messages.where(user: conversation.receiver, seen: false)
    #   receiver_unseen_msgs.each do |msg|
    #     msg.update(seen: true)
    #   end
    # else
    #   sender_unseen_msgs = conversation.messages.where(user: conversation.sender, seen: false)
    #   sender_unseen_msgs.each do |msg|
    #     msg.update(seen: true)
    #   end
    # end

  end

  def destroy
  end
end
