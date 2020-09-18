class Api::V1::VideoController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render status: :ok
  end

  def create
    @video = Video.new(video_params)

    if @video.save
      render json: {msg: 'ok'}, status: :created
    else
      render status: :unprocessable_entity
    end
  end

  def video_params
    params.require(:video).permit(:name, :description, :file)
  end
end
