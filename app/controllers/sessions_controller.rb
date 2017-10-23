class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      json_response(user)
    else
      json_response(error)
    end
  end

  def destroy
  end
end
