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
      render json: @post.errors, status:422
    end
  end

  private

  def post_params
    require(:post).permit(:header)
  end
end
