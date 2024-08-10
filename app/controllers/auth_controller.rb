class AuthController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:login, :register]

  def register
    @user = User.new(user_params)

    if @user.save
      token = JsonWebToken.issue_token(user_id: @user.id)
      render json: { user: @user, token: token }, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def login
    @user = User.find_by(email: params[:email])

    if @user&.authenticate(params[:password])
      token = JsonWebToken.issue_token(user_id: @user.id)
      render json: { user: @user, token: token }, status: :ok
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  def logout
    render json: { message: 'Logged out' }, status: :ok
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end