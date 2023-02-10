class MiniroomfavoritesController < ApplicationController
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
