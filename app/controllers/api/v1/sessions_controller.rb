class Api::V1::SessionsController < ApplicationController
  before_action :check_token, if: -> { request.post? && request.env['REQUEST_PATH'] != '/api/v1/auth' }
  skip_before_action :verify_authenticity_token

  def auth
    user = User.find_by(email: params[:email])
    return head :not_found if user.nil?

    jwt_instance = JWTManager::Auth.new(user, params[:password])

    if jwt_instance.authorized?
      token = jwt_instance.token!

      render json: { token: token }, status: :ok
    end
  end

  def check_token
    auth_token = request.headers['Authorization']

    valid = JwtTokenList.find_by(jwt: auth_token)

    render json: { msg: 'Invalid token' } unless valid
  end
end
