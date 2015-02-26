class AuthenticationsController < ApplicationController
  def index
    @authentications = current_user.authentications if current_user
  end

  def create
    auth = request.env["omniauth.auth"]
    authentication = Authentication.find_by(provider: auth['provider'], uid: auth['uid'])
    if authentication
      flash[:notice] = "Authentication successful."
      session[:user_id] = authentication.user.id
      redirect_to cars_path
    elsif current_user
      current_user.authentications.create(:provider => auth['provider'], uid: auth['uid'])
      flash[:notice] = "Authentication successful."
      redirect_to cars_path
    else
      user = User.new
      user.authentications.build(:provider => auth['provider'], uid: auth['uid'])
      user.save!
      flash[:notice] = "Authentication successful."
      session[:user_id] = user.id
      redirect_to cars_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Successfully destroyed authentication."
    redirect_to cars_path
  end
end
