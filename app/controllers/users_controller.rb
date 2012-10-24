class UsersController < ApplicationController

  before_filter :authenticate, :only => [:edit, :update, :show]
  before_filter :correct_user, :only => [:edit, :update]

  def index
    @title = title_translate
    @q = User.ransack(params[:q])
    @users = @q.result(:distinct => true).order("id ASC").page(params[:page])
  end

  def new
    @title = title_translate
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = flash_translate :success
      redirect_to @user
    else
      flash[:error] = flash_translate :error
      @title = title_translate
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    @title = title_translate
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = flash_translate :success
      redirect_to @user
    else
      flash[:error] = flash_translate :error
      @title = title_translate
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
    @title = title_translate
  end

  private

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path,:flash => {:error => flash_translate(:error)}) unless current_user?(@user)
  end

end
