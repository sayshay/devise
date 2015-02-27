class UsersController < ApplicationController


  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to request.referer
    else
      render 'new'
    end
  end

  def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
