require 'rails_helper'

RSpec.describe 'Api::V1::VideosController', type: :request do
  it 'returns true' do
    expect(create(:user)).to be_truthy
  end
end
