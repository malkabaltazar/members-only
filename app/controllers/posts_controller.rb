class PostsController < ApplicationController
  before_action :signed_in, only: [:new, :create]

  def new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      @post.update_attribute(:user_id, @current_user.id)
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def index
    @posts = Post.all
    @current_user = current_user
  end

  def show
  end

  private

    def post_params
      params.require(:post).permit(:title, :body)
    end
end
