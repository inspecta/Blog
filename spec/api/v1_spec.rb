require 'swagger_helper'

RSpec.describe 'Users API', type: :request do
  path 'api/users/{id}' do
    get 'Retrieves user details' do
      tags 'Users'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'user found' do
        schema type: :object,
          properties: {
            name: { type: :string },
            photo: { type: :text },
            bio: { type: :string },
            posts_counter: { type: :integer},
          },
          required: [ 'name', 'photo', 'bio', 'posts_counter' ]

        let(:id) { User.create(name: 'John', photo: 'john@example.com', bio: 'john@example.com', posts_counter: 0) }
        run_test!
      end

      response '404', 'user not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  # Show use posts
  path 'api/users/{id}/posts' do
    post 'Add a post' do
      tags 'Posts'
      produces 'application/json'
      parameter name: :user_id, in: :path, type: :string

      response '200', 'user found' do
        schema type: :object,
          properties: {
            title: { type: :string },
            text: { type: :string },
            comments_counter: { type: :integer },
            likes_counter: { type: :integer},
            author_id: { type: :integer}
          },
          required: [ 'title', 'text', 'comments_counter', 'likes_counter', 'author_id' ]

        let(:id) { 
          Post.create(
            title: 'Hello',
            text: 'This is my first post',
            comments_counter: 0,
            likes_counter: 0,
            author_id: @user.id
          )
        }
        run_test!
      end

      response '404', 'user not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
