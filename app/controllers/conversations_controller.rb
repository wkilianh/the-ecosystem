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
    # convs_ids = []
    # @conversations.each do |conv|
    #   convs_ids << conv.id
    # end
    respond_to do |format|
      format.html
      format.json { render json: { conversations: @conversations } }
    end
  end

  def show
    @conversation = Conversation.find(params[:id])
    current_user.update(conversation_channel: @conversation.id)
    @message = Message.new
    authorize @conversation

    if current_user == @conversation.sender 
      @conversation.sender_notifications  = 0 
    else 
      @conversation.receiver_notifications = 0 
    end 
    @conversation.save
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
