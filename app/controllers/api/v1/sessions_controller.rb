class Api::V1::SessionsController < ApplicationController
  before_action :check_token, if: -> { request.post? && request.env['REQUEST_PATH'] != '/api/v1/auth' }
  skip_before_action :verify_authenticity_token

  include BCrypt

  def auth
    user = User.find_by(email: params[:email])
    encrypted_pass = BCrypt::Password.new(user.encrypted_password)
    authorized = encrypted_pass == params[:password]

    if authorized
      payload = "#{user.email} #{encrypted_pass}"
      token = JWT.encode payload, nil, 'none'

      JwtTokenList.find_or_create_by(jwt: token, user: user)

      render json: { token: token }, status: :ok
    end
  end

  def check_token
    auth_token = request.headers['Authorization']

    valid = JwtTokenList.find_by(jwt: auth_token)

    render json: { msg: 'Invalid token' } unless valid
  end
end
