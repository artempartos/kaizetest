class UsersController < ApplicationController

  def index
  end

  def new
    @title = "Sign up"
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save

      #sign_in @user
      flash[:success] = "Welcome to simple task manager!"
      redirect_to @user
    else
      @title = "Sign up"
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def show
  end
end
