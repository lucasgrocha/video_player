class Api::V1::VideoController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @videos = Video.select(:id, :name, :description, :file, :user_id, :views).order(created_at: :desc)

    render status: :ok
  end

  def create
    @video = Video.new(video_params)

    if @video.save
      render json: { msg: 'ok' }, status: :created
    else
      render status: :unprocessable_entity
    end
  end

  def show
    @video = Video.find(params[:id])

    render status: :ok
  end

  def recommended_videos
    @videos = Video.first(10).shuffle

    render 'index', status: :ok
  end

  def video_params
    params.require(:video).permit(:name, :description, :file)
  end
end
