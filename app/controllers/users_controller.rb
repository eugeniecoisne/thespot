class UsersController < ApplicationController
  def index
    @users = policy_scope(User)
  end

  def show
    @current_user = current_user
    authorize @current_user
  end
end
