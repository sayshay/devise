class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    authentication = Authentication.find_by(user_id: user.id)
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cars_path
    else
      flash[:notice] = 'Email or password is invalid'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out!"
  end
end
