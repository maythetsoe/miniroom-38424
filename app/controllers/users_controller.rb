class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  def show
    @user = User.find(params[:id])
    @donations = @user.donations
    @minirooms = @user.minirooms
  end

  def index
    @users = User.where.not(id: current_user.id)
  end

  def followings
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end

end
