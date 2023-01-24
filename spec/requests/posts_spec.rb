require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:example) { get user_posts_path(1) }

    it 'should return a successful response' do
      expect(response).to have_http_status(:success)
    end

    it 'shoud render posts/index.html.erb template' do
      expect(response).to render_template('index')
    end

    it 'response body should contain' do
      expect(response.body).to include('Posts Page')
    end
  end

  describe 'GET /show' do
    before(:example) { get user_posts_path(1,1)}

    it 'should return a successful response' do
      expect(response).to have_http_status(:success)
    end
  end
end
