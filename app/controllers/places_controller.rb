class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:filter].nil?
      @places = policy_scope(Place)
    else
      if params[:filter][:address].present? && params[:filter][:category].present?
        @address = params[:filter][:address]
        @category = params[:filter][:category]
        @places = policy_scope(Place).search_city(@address).search_category(@category)
      elsif params[:filter][:address].present? && !params[:filter][:category].present?
        @address = params[:filter][:address]
        @places = policy_scope(Place).search_city(@address)
      elsif params[:filter][:category].present? && !params[:filter][:address].present?
        @category = params[:filter][:category]
        @places = policy_scope(Place).search_category(@category)
      else
        @places = policy_scope(Place)
      end
    end

    @places_geo = @places.geocoded
    @markers = @places_geo.map do |place|
      {
        lat: place.latitude,
        lng: place.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { place: place })
      }
    end
  end

  def show
    authorize @place
    @user = current_user
    @booking = Booking.new
    @place_review = PlaceReview.new
    @markers = [{
      lat: @place.latitude,
      lng: @place.longitude
    }]
  end

  def new
    @place = Place.new
    authorize @place
  end

  def create
    @place = Place.new(place_params)
    authorize @place
    @place.user = current_user
    if @place.save
      redirect_to place_path(@place)
    else
      render :new
    end
  end

  def edit
    authorize @place
  end

  def update
    authorize @place
    @place.update(place_params)
    if @place.save
      redirect_to place_path(@place)
    else
      render :edit
    end
  end

  def destroy
    authorize @place
    @place.destroy
    redirect_to user_path(current_user)
  end

  private

  def set_place
    @place = Place.find(params[:id])
  end

  def place_params
    params.require(:place).permit(:title, :description, :category, :address, :capacity, :price, photos: [])
  end
end
