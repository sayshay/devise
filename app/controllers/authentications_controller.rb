class AuthenticationsController < ApplicationController
  def index
    @authentications = current_user.authentications if current_user
  end

  def create
    auth = request.env["omniauth.auth"]
    authentication = Authentication.find_by(provider: auth['provider'], uid: auth['uid'])
    if authentication
      flash[:notice] = "Authentication successful."
      sign_in_and_redirect(:user, authentication.user)
    elsif current_user
      current_user.authentications.create(:provider => auth['provider'], uid: auth['uid'])
      flash[:notice] = "Authentication successful."
      redirect_to authentications_url
    else
      user = User.new
      user.authentications.build(:provider => auth['provider'], uid: auth['uid'])
      user.save!
      flash[:notice] = "Authentication successful."
      sign_in_and_redirect(:user, user)
    end
  end

  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    flash[:notice] = "Successfully destroyed authentication."
    redirect_to authentications_url
  end
end
