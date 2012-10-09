class UsersController < ApplicationController

  before_filter :authenticate, :only => [:edit, :update, :show]
  before_filter :correct_user, :only => [:edit, :update]

  def index
    @title = "Users"
    @users = User.paginate(:page => params[:page], :per_page => 10)
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
    @user = User.find(params[:id])
    @title = @user.name
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated."
      redirect_to @user
    else
      flash[:error] = "Error"
      @title = "Edit user"
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
    @title = @user.name
  end

  private

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path,:flash => {:error => "Access denied"}) unless current_user?(@user)
  end

end
