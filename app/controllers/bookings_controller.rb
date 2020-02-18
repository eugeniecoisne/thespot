class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  def index
    @bookings = Booking.all
  end

  def show
  end

  def create
    @booking = Booking.new(booking_params)
    @current_user = current_user
    @place = Place.find(params[:place_id])
    @booking.user = @current_user
    @booking.place = @place
    if @booking.save
      redirect_to user_bookings_path(@current_user)
    else
      render 'places/show'
    end
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    if @booking.save
      redirect_to user_bookings_path(@booking.user)
    else
      render 'edit'
    end
  end

  def destroy
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
