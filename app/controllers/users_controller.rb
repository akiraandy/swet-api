class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create!(user_params)
    json_response(@user, :created)
  end

  private

  def user_params
    params.permit(:email, :password, :name)
  end
end
