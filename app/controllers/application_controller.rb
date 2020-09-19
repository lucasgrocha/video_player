class ApplicationController < ActionController::Base
  before_action :verify_signed_user!

  def verify_signed_user!
    cookies[:signed_in] = current_user.nil? ? 0 : 1
  end
end
