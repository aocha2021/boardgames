class ReviewsController < ApplicationController
  before_action :require_user_logged_in
  def new
    @review = Review.new
  end

  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      flash[:success] = 'レビューを投稿しました。'
      redirect_to user
    else
      @pagy, @reviews = pagy(current_user.feed_reviews.order(id: :desc))
      flash.now[:danger] = 'レビューの投稿に失敗しました。'
      render 'new_review'
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
    params.require(:review).permit(:content, :design, :luck, :easy, :strategy, :teamwork)
  end
  
  
end
