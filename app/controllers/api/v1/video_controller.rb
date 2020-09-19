class Api::V1::VideoController < Api::V1::SessionsController
  def index
    @videos = Video.select(:id, :name, :description, :file, :user_id, :views).order(created_at: :desc)

    render status: :ok
  end

  def create
    @video = Video.new(video_params)
    auth_token = request.headers['Authorization']
    user = JwtTokenList.find_by(jwt: auth_token).user
    @video.user = user

    if @video.save
      head :created
    else
      head :unprocessable_entity
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
