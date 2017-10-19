module Api
  class PostsController < ApplicationController
    def index
      @posts = (params[:top].present? & params[:top].to_i.integer?) ? top_posts.first(params[:top]) : all_posts
      render json: @posts
    end

    def create
      if params[:login].present?
        @user = User.find_or_create_by(login: params[:login])
      else
        @user = User.create(login: 'noname')
      end
      @post = Post.new post_params.merge!(user_id: @user.id)
      if @post.save
        render json: @post, status: 201
      else
        render json: @post.errors[:base], status: 422
      end
    end

    def update
      @rating = Rating.new rating_params
      if @rating.save
        @post = Post.find(@rating.post_id)
        rating = AverageRatingCalc.new(@post).calc
        @post.update_attribute :average_rating, rating
        render json: @post.average_rating, status: 201
      else
        render json: @rating.errors[:base], status: 422
      end
    end

    def get_authors
      @posts = Post.select('posts.author_ip, users.login').joins(:user)
      render json: @posts
    end

    private

    def all_posts
      Post.select('posts.id, posts.header, posts.content').order(created_at: :desc)
    end

    def top_posts
      Post.select('posts.id, posts.header, posts.content').where.not(average_rating: nil).order(average_rating: :desc)
    end

    def post_params
      params.require(:post).permit(:header, :content, :author_ip, :user_id, :average_rating)
    end

    def rating_params
      params.require(:rating).permit(:rating, :post_id)
    end
  end
end
