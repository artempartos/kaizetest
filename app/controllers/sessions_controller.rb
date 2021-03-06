class SessionsController < ApplicationController
  def new
    @title = title_translate
  end

  def create
    user = User.auth(params[:session][:email],
                     params[:session][:password])
    if user.present?
      sign_in user
      redirect_back_or root_path, :notice => flash_translate(:notice)
    else
      flash.now[:error] = flash_translate(:error)
      title_translate
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url, :notice => flash_translate(:notice)
  end

end