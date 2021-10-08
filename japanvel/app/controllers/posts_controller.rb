class PostsController < ApplicationController

  def index
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to prefecture_path(@post.area_id)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
      redirect_to prefecture_path(@post.area_id)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
      redirect_to prefecture_path(@post.area_id)
  end

  private
   def post_params
     params.require(:post).permit(:user_id, :place_name, :image, :address, :detail, :area_id)
   end


end
