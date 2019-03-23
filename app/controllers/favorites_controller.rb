class FavoritesController < ApplicationController
 before_action :require_user_logged_in

  def create
    micropost=Micropost.find(params[:favorite_id])
    current_user.like(micropost)
    flash[:success] = 'お気に入りを登録しました。'
    redirect_back(fallback_location: root_url)
  end

  def destroy
    favorite = Favorite.find(params[:id])
    favorite.destroy
    flash[:success] = 'お気に入りを解除しました。'
    redirect_back(fallback_location: root_url)
  end
  
end