class FavoritesController < ApplicationController
  def create
    @donation_favorite = Favorite.new(user_id: current_user.id, donation_id: params[:donation_id])
    @donation_favorite.save
    redirect_to donation_path(params[:donation_id]) 
  end

  def destroy
    @donation_favorite = Favorite.find_by(user_id: current_user.id, donation_id: params[:donation_id])
    @donation_favorite.destroy
    redirect_to donation_path(params[:donation_id]) 
  end
end
