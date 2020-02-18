class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  def index
    @bookings = policy_scope(Booking).order(date: :desc)
  end

  def show
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @current_user = current_user
    @place = Place.find(params[:place_id])
    @booking.user = @current_user
    @booking.place = @place
    if @booking.save
      redirect_to root_path
    else
      render 'places/show'
    end
  end

  def edit
    authorize @booking
  end

  def update
    authorize @booking
    @booking.update(booking_params)
    if @booking.save
      redirect_to user_bookings_path(@booking.user)
    else
      render 'edit'
    end
  end

  def destroy
    authorize @booking
    @booking.destroy
    redirect_to user_bookings_path(@booking.user)
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:date)
  end
end
