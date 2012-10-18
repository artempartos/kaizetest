class UsersController < ApplicationController

  before_filter :authenticate, :only => [:edit, :update, :show]
  before_filter :correct_user, :only => [:edit, :update]

  def index
    @title = t :users
    @users = User.page params[:page]
  end

  def new
    @title = t :sign_up
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = t :hello
      redirect_to @user
    else
      @title = t :sign_up
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    @title = @user.name
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = t :profile_updated
      redirect_to @user
    else
      flash[:error] = t :failed
      @title = t :edit_user
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
    redirect_to(root_path,:flash => {:error => t(:access_denied)}) unless current_user?(@user)
  end

end
