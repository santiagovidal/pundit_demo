class PostsController < ApplicationController
  before_action :get_post, only: [:show, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    authorize Post
  end

  def create
    authorize Post
    @post = Post.create(post_params.merge(user_id: current_user.id))
    redirect_to @post
  end

  def show
    authorize @post
  end

  def destroy
    authorize @post
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :description)
  end

  def get_post
    @post = Post.find(params[:id])
  end
end
