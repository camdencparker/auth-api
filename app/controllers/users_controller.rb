class UsersController < ApplicationController
  def create
    user = User.new( name: params[:name],
      email: params[:email],
      phone_number: params[:phone_number],
      password_confirmation: params[:password_confirmation],
      password: params[:password])
    if user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def show
    if current_user
      render json: current_user
    else
      render json: {}, status: :unauthorized
    end
    
  end
end
