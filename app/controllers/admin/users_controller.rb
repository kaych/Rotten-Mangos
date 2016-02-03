class Admin::UsersController < ApplicationController

  before_filter :admin_only

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(admin_user_params)
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def create
    @user = User.new(admin_user_params)

    if @user.save
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path
    flag[:alert] = "That user is a goner! Byeeee"
  end

  protected

  def admin_user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation, :admin)
  end

end
