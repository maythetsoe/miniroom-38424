class MiniroomfavoritesController < ApplicationController
  def create
    @miniroom_favorite = Miniroomfavorite.new(user_id: current_user.id, miniroom_id: params[:miniroom_id])
    @miniroom_favorite.save
    redirect_to miniroom_path(params[:miniroom_id]) 
  end

  def destroy
    @miniroom_favorite = Miniroomfavorite.find_by(user_id: current_user.id, miniroom_id: params[:miniroom_id])
    @miniroom_favorite.destroy
    redirect_to miniroom_path(params[:miniroom_id]) 
  end
end
