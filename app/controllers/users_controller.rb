class UsersController < ApplicationController
  def show
    @current_user = current_user
    authorize @current_user
  end

  def public
    @user = User.find(params[:user_id])
    @user_review = UserReview.new
    authorize @user
  end
end
