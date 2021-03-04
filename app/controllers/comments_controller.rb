class CommentsController < ApplicationController

  def create
    comment = Comment.new(comment_params)
    comment.user =  current_user
    comment.post = Post.find(params[:post_id])
    authorize comment
    if comment.save!
      redirect_to "#{post_path(comment.post)}/#comments"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end
