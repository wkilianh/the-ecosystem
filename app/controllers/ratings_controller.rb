class RatingsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @rating = Rating.new(rating_params)
    authorize @rating
#    @rating.avg = @rating.calc_avg
    @rating.post_id = params[:post_id]
    @rating.user_id = current_user.id
    if @rating.save
      flash.alert = "Rating saved!"
      redirect_to post_path(@post)
    else
      redirect_to post_path(@post)
      flash.alert = "Please don't leave blank fields!"
    end
  end


  private

  def rating_params
    params.require(:rating).permit(:co2, :waste, :resources, :diyeffort, :ecocost, :avg)
  end

end
