class PostsController < ApplicationController
  def index
    @posts = Post.order(created_at: :desc)
    render json: @posts
  end

  def create
    @post = Post.new post_params
    if @post.save
      render json: @post
    else
      render json: { errors: @post.errors.full_messages }
    end
  end

  private

  def posts_params
    require(:post).permit(:header, :content, :user_id, :author_ip)
  end
end
