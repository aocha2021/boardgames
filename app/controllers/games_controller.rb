class GamesController < ApplicationController
  def index
    @pagy, @games = pagy(Game.order(id: :desc), items: 8)
  end

  def new
    @game = Game.new
  end

  def show
    @game = Game.find(params[:id])
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      flash[:success] = 'ゲームを登録しました。'
      redirect_to root_path
    else
      flash.now[:danger] = 'ゲームの登録に失敗しました。'
      render :new
    end
  end

  

  private

  def game_params
    params.require(:game).permit(:title, 
                                 :release,
                                 :producer)
  end


end
