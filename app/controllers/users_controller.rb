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
      redirect_to users_mypage_path
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
    redirect_to root_path
  end

  private
   def user_params
     params.require(:user).permit(:name, :email, :password)
   end

end
