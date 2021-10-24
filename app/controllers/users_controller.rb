class UsersController < ApplicationController

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to users_mypage_path, notice: '更新が完了しました'
    else
      render :edit
    end
  end

  def verify
    @user = current_user
  end

  def withdrawl
    @user = current_user
    @user.update(is_active: false)
    reset_session
    redirect_to root_path, notice: '退会が完了しました'
  end

  private
   def user_params
     params.require(:user).permit(:name, :email, :password)
   end

end
