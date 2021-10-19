class FavoritesController < ApplicationController
  before_action :require_user_logged_in

  def create
    game = Game.find(params[:game_id])
    current_user.favorite(game)
    flash[:success] = 'お気に入りに登録しました。'
    redirect_to game
  end

  def destroy
    game = Game.find(params[:game_id])
    current_user.unfavorite(game)
    flash[:success] = 'お気に入りに解除しました。'
    redirect_to game
  end
end