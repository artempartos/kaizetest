class SessionsController < ApplicationController
  def new
    @title = "Sign in"
  end

  def create
    user = User.auth(params[:session][:email],
                     params[:session][:password])
    if user.nil?
      flash.now[:error] = "Invalid email/password combination."
      @title = "Sign in"
      render 'new'
    else
      #session[:user_id] = user.id
      sign_in user
      #redirect_to root_url, :notice => "Logged in!"
      redirect_back_or user, :notice => "Logged in!"
    end
  end

  def destroy
    sign_out
    redirect_to root_url, :notice => "Logged out!"
  end

end