class Admin::UsersController < ApplicationController

  before_filter :admin_only

  def index
    @users = User.all
  end

end
