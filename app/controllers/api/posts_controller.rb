module Api
  class PostsController < ApplicationController
    def index
      @posts = Post.order(created_at: :desc)
      render json: @posts
    end

    def create
      @post = Post.new post_params
      if @post.save
        render json: @post, status: 201
      else
        render json: @post.errors[:base], status: 422
      end
    end

    def rating
      @rating = Rating.new(rating_params)
      if @rating.save
        @post = Post.find(@rating.post_id)
        rating = AverageRatingCalc.new(@post).calc
        @post.update_attribute :average_rating, rating
        render json: @post, status: 201
      else
        render json: @rating.errors[:base], status: 422
      end
    end

    def top_posts
      max = 5
      @posts = Post.where(average_rating: max)
    end

    private

    def post_params
      params.require(:post).permit( :header, :content, :author_ip, :user_id, :average_rating )
    end

    def rating_params
      params.require(:rating).permit(:rating, :post_id )
    end
  end
end
