require 'rails_helper'

RSpec.describe 'Api::Users', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/api/users/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/api/users/show'
      expect(response).to have_http_status(:success)
    end
  end
end
