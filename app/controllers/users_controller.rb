class UsersController < ApplicationController
  respond_to :json
  before_action :set_user, only: [:show]

  def show
    json_response(@user)
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: 201
    else
      render json: { errors: user.errors }, status: 422
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation, :confirm_success_url)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
