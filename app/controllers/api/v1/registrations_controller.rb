class Api::V1::RegistrationsController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :user_params

  def create
    @user = User.new(user_params)

    if @user.save
      token = JWTManager::Build.new(@user).call

      render json: { token: token }, status: :ok
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end
end
