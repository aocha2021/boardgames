class ToppagesController < ApplicationController
  def index
    @pagy, @games = pagy(Game.order(id: :desc), items: 8)
  end
end
