class SessionsController < ApplicationController
  def new
    @title = "Sign in"
  end

  def create
    user = User.auth(params[:session][:email],
                     params[:session][:password])
    if user.present?
      sign_in user
      redirect_back_or root_path, :notice => "Logged in!"
    else
      flash.now[:error] = "Invalid email/password combination."
      @title = "Sign in"
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url, :notice => "Logged out!"
  end

end