class UsersController < ApplicationController

  before_filter :authenticate, :only => [:edit, :update, :show]
  before_filter :correct_user, :only => [:edit, :update]

  def index
    @title = t('users.all_users')
    @q = User.ransack(params[:q])
    @users = @q.result(:distinct => true).order("id ASC").page(params[:page])
  end

  def new
    @title = t 'title.sign_up'
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = flash_translate :success
      redirect_to @user
    else
      flash[:error] = flash_translate :error
      @title = t 'title.sign_up'
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    @title = @user.name
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = flash_translate :success
      redirect_to @user
    else
      flash[:error] = flash_translate :error
      @title = t 'title.edit'
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
    redirect_to(root_path,:flash => {:error => flash_translate(:error)}) unless current_user?(@user)
  end

end
