class ConversationsController < ApplicationController


  def create
    sender = current_user
    post = Post.find(params[:post_id])
    receiver = post.user
    conversation = Conversation.new(sender: sender, receiver: receiver)
    authorize conversation
    if Conversation.find_by(sender: sender, receiver: receiver) || Conversation.find_by(sender: receiver, receiver: sender)
      redirect_to "/conversations/#sidebar"
    else
      if conversation.save!
        redirect_to "/conversations/"
      end
    end

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

  private

  def conversation_params
    params.require(:conversation).permit(:sender, :receiver)
  end
end
