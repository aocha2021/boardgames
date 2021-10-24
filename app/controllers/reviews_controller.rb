class ReviewsController < ApplicationController
  before_action :require_user_logged_in
  def new
    @game = Game.find(params[:id])
    @review = Review.new
  end

  def create
    @review = current_user.reviews.build(review_params)
    @review.game_id = params[:id]
    if @review.save
      flash[:success] = 'レビューを投稿しました。'
      redirect_to game_path
    else
      @pagy, @reviews = pagy(current_user.reviews.order(id: :desc))
      flash.now[:danger] = 'レビューの投稿に失敗しました。'
      render :new
    end
  end

  def edit
  end

  def destroy
  end

  def update
  end

  private

  def review_params
    params.require(:review).permit(:game_id, :content, :design, :luck, :easy, :strategy, :teamwork)
  end
  
  
end


#:design, :luck, :easy, :strategy, :teamwork