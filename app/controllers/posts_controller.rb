class PostsController < ApplicationController

  def index
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to prefecture_path(@post.area_id), notice: '投稿が完了しました'
    else
      render :index
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to prefecture_path(@post.area_id), notice: '更新が完了しました'
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
      redirect_to prefecture_path(@post.area_id), notice: '削除が完了しました'
  end

  def search
    @posts = Post.search(params[:keyword])
    @posts = Kaminari.paginate_array(@posts).page(params[:page]).per(6)
    @keyword = params[:keyword]
    render "search"
  end

  private
   def post_params
     params.require(:post).permit(:user_id, :place_name, :image, :address, :detail, :area_id, :keyword)
   end


end
