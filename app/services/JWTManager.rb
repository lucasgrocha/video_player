module JWTManager
  include BCrypt

  class Auth
    def initialize(user, password)
      @user = user
      @password = password
    end

    def token!
      payload = "#{@user.email} #{@user.encrypted_password}"
      token = JWT.encode payload, nil, 'none'

      JwtTokenList.find_or_create_by(jwt: token, user: @user)

      token
    end

    def authorized?
      encrypted_pass = BCrypt::Password.new(@user&.encrypted_password)

      encrypted_pass == @password
    end
  end

  class Build < Auth
    def initialize(user)
      @user = user
    end

    def call
      token!
    end
  end
end
