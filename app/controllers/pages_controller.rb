class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  # def index
  #   @places = Place.all
  # end
end
