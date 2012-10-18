class SessionsController < ApplicationController
  def new
    @title = t :sign_in
  end

  def create
    user = User.auth(params[:session][:email],
                     params[:session][:password])
    if user.present?
      sign_in user
      redirect_back_or root_path, :notice => t(:logged_in)
    else
      flash.now[:error] = t :session_new_failed
      @title = t :sign_in
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url, :notice => t(:logged_out)
  end

end