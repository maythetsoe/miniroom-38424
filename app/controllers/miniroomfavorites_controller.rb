class MiniroomfavoritesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :miniroomfavorite_params, only: [:create, :destroy]
  def create
    @miniroom_miniroomfavorite = Miniroomfavorite.new(miniroomfavorite_params)
    @miniroom_miniroomfavorite.save
    redirect_to miniroom_path(params[:miniroom_id]) 
  end

  def destroy
    @miniroom_miniroomfavorite = Miniroomfavorite.find_by(miniroomfavorite_params)
    @miniroom_miniroomfavorite.destroy
    redirect_to miniroom_path(params[:miniroom_id]) 
  end

  private
  def miniroomfavorite_params
    {miniroom_id: params[:miniroom_id], user_id: current_user.id}
  end
end
