class Api::V1::VideoController < ApplicationController
  def index
    render status: :ok
  end

  def create
    binding.pry
  end

  def video_params
    params.require(:video).permit(:name, :description, files: [])
  end
end
