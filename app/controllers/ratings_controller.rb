class RatingsController < ApplicationController
  def create
    @post = Post.find params[:id]
    @rating = Rating.new(post_id: @post.id)
  end

  private

  def rating_params
    require(:rating).permit(:rating, :post_id )
  end
end
