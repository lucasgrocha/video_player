class Api::V1::SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  include BCrypt

  def auth
    user = User.find_by(email: params[:email])
    encrypted_pass = BCrypt::Password.new(user.encrypted_password)
    authorized = encrypted_pass == params[:password]

    if authorized
      payload = "#{user.email} #{params[:password]}"
      token = JWT.encode payload, nil, 'none'

      JwtTokenList.find_or_create_by(jwt: token)

      render json: { token: token }, status: :ok
    end
  end
end
