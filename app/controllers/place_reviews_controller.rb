class PlaceReviewsController < ApplicationController
  def create
    @place = Place.find(params[:place_id])
    @user = current_user
    @place_review = PlaceReview.new(place_review_params)
    authorize @place_review
    @place_review.place = @place
    @place_review.user = @user
    if @place_review.save
      redirect_to place_path(@place)
    else
      render 'places/show'
    end
  end

  private

  def place_review_params
    params.require(:place_review).permit(:rating, :content)
  end
end
