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

  private
   def post_params
     params.require(:post).permit(:user_id, :place_name, :image, :address, :detail, :area_id)
   end


end
