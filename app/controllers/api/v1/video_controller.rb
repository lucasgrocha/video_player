class Api::V1::VideoController < Api::V1::SessionsController
  before_action :set_user, only: %i[create user_videos destroy edit update]

  def index
    @videos = Video.select(:id, :name, :description, :file, :user_id, :views).order(created_at: :desc)

    render status: :ok
  end

  def create
    @video = Video.new(video_params)
    @video.user = @user

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

  def edit
    @video = Video.find(params[:id])

    return head :unprocessable_entity unless @video.user == @user

    render 'show', status: :ok
  end

  def update
    @video = Video.find(params[:id])
    return head :unprocessable_entity unless @video.user == @user

    if @video.update(video_params)
      head :ok
    else
      head :unprocessable_entity
    end
  end

  def user_videos
    @videos = @user&.videos

    render 'index', status: :ok
  end

  def destroy
    @video = Video.find(params[:id])

    return head :unprocessable_entity unless @video.user == @user

    head :no_content if @video.destroy
  end

  private

  def video_params
    params.require(:video).permit(:name, :description, :file)
  end

  def set_user
    auth_token = request.headers['Authorization']
    @user = JwtTokenList.find_by(jwt: auth_token).user
  end
end
