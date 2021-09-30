class PrefecturesController < ApplicationController

def index
  @prefecture = Prefecture.new
end

def create
  @prefecture = prefecture.new(prefecture_params)
  @prefecture.user_id = current_user.id
  @prefecture.save
  redirect_to prefecture_params
end

  private
   def prefecture_params
     params.require(:prefecture).permit(:user_id, :image, :address, :point, :detail, :area_id)
   end
end
