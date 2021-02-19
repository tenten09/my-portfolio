class Api::V1::PostsController < ApplicationController
  # before_action :authenticate_user!, only: [:create]

  def index
    @posts = Post.order('created_at DESC')
  end

  def create
    current_user = User.find(params[:user_id])
    @post = current_user.posts.new(post_params)
    if @post.save
      render :show, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end
 
  private
    def post_params
      params.require(:post).permit(:title, :content)
    end
end