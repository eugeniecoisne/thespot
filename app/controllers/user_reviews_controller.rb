class UserReviewsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @user_review = UserReview.new(user_review_params)
    authorize @user_review
    @user_review.user = @user
    if @user_review.save
      redirect_to public_user_path(@user)
    else
      render 'users/public'
    end
  end

  private

  def user_review_params
    params.require(:user_review).permit(:rating, :content)
  end
end
