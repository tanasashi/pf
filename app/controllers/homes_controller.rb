class HomesController < ApplicationController

  def top
  end

  def abput
  end

  def bookmarks
    @bookmarks = Bookmark.where(user_id: current_user.id)
    @posts = Post.where(area_id: params[:id] )
  end


end