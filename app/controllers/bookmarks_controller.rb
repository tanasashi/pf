class BookmarksController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    bookmark = @post.bookmarks.new(user_id: current_user.id)
    bookmark.save
      redirect_to request.referer, notice: 'ブックマークに追加されました'
  end

  def destroy
    @post = Post.find(params[:post_id])
    bookmark = @post.bookmarks.find_by(user_id: current_user.id)
    bookmark.destroy
      redirect_to request.referer, notice: 'ブックマークを外しました'
  end

  def index
    @bookmarks = Bookmark.where(user_id: current_user.id).order(created_at: "DESC").page(params[:page]).per(6)
  end

end
