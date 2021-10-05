class PrefecturesController < ApplicationController


  def show
    @posts = Post.where(area_id: params[:id] )
    
  end

  private
   def prefecture_params
     params.require(:prefecture).permit(:post_id)
   end
end
