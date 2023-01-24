require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:example) { get users_path }

    it 'shoud be a successful response' do
      expect(response.status).to eq(200)
    end

    it 'shoud be a success' do
      expect(response).to have_http_status(:success)
    end

    it 'should render the index.html.erb template' do
      expect(response).to render_template('index')
    end

    it 'response body should contain #Home Page' do
      expect(response.body).to include('Home Page')
    end

    it 'response body should contain #ListOfAllUsers' do
      expect(response.body).to include('List of all users.')
    end
  end

  describe 'GET /show' do
    before(:example) { get user_path(1) }

    it 'should be a successful response' do
      expect(response.status).to eq(200)
    end

    it 'should render the show template' do
      expect(response).to render_template('show')
    end

    it 'response should contain #UserDetailsPage' do
      expect(response.body).to include('User details page')
    end
  end
end
