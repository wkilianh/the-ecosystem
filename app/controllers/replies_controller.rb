class RepliesController < ApplicationController

  def create
    reply = Reply.new(reply_params)
    reply.user = User.find(params[:user_id])
    comment = Comment.find(params[:comment_id])
    reply.comment = comment
    authorize reply
    if reply.save!
      redirect_to "#{post_path(comment.post)}/#comments"
    end
  
  end

  private

  def reply_params
    params.require(:reply).permit(:content)
  end

end
