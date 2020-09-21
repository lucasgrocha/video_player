require 'rails_helper'

RSpec.describe 'Api::V1::VideosController', type: :request do
  context 'when needs a signed in user' do
    let!(:user) { attributes_for(:user) }
    token = ''

    before do
      post '/api/v1/registrations', params: {
        user: user
      }
      token = json_parse(response.body)['token']
    end

    context 'when has valid user info' do
      describe 'POST /api/v1/auth' do
        it 'returns jwt token' do
          post '/api/v1/auth', params: {
            email: user[:email], password: user[:password]
          }

          parsed = json_parse(response.body)

          expect(parsed['token'].size > 0).to be_truthy
        end
      end
    end

    context 'when has not valid user info' do
      describe 'POST /api/v1/auth' do
        it 'returns forbidden http status' do
          post '/api/v1/auth', params: {
            email: user[:email], password: '@@@'
          }

          expect(response).to have_http_status(:forbidden)
        end
      end
    end
  end

  context 'when signed in user is not necessary' do
    describe 'GET /videos' do
      let(:videos_quantity) { 10 }

      before do
        create_list(:video, videos_quantity)

        get '/api/v1/videos'
      end

      it "verifies if the response's body has the correct length" do
        expect(json_parse(response.body).size).to eq(videos_quantity)
      end

      it 'returns http status success' do
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET /videos/:id' do
      context 'when requested video exists' do
        let(:videos_quantity)   { 20 }
        let!(:videos)           { create_list(:video, videos_quantity) }
        let(:selected_id)       { videos.map(&:id).sample }

        before do
          get "/api/v1/videos/#{selected_id}"
        end

        it "verifies if the response has the correct video's name & description" do
          parsed = json_parse(response.body)

          expect(parsed['name'] == Video.find(selected_id).name).to be_truthy
          expect(parsed['description'] == Video.find(selected_id).description).to be_truthy
        end

        it 'returns http status success' do
          expect(response).to have_http_status(:success)
        end
      end

      context 'when requested video does not exists' do
        it 'raises an error' do
          expect { get '/api/v1/videos/0' }.to raise_error(ActiveRecord::RecordNotFound)
        end
      end
    end

    describe 'GET /recommended_videos' do
      before do
        create_list(:video, 20)

        get '/api/v1/recommended_videos'
      end

      it "validates the first 10 Video's id" do
        response_ids = json_parse(response.body).map { |video| video['id'] }.sort
        first_videos_ids = Video.first(10).map(&:id).sort

        expect(first_videos_ids == response_ids).to be_truthy
      end

      it 'returns http status success' do
        expect(response).to have_http_status(:success)
      end
    end

    describe 'PUT /incrementView' do
      let!(:video)  { create(:video) }
      let(:views)   { video.views }

      before do
        put '/api/v1/incrementView', params: { id: video.id }
      end

      it 'increments a view' do
        expect(views + 1).to eq(Video.find(video.id).views)
      end

      it 'returns http status success' do
        expect(response).to have_http_status(:success)
      end
    end
  end

  def json_parse(data)
    JSON.parse(data)
  end
end
