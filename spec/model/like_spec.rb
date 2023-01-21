require 'rails_helper'

RSpec.describe Like, type: :model do
  before :all do
    @user = User.create(
      name: 'Tom',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Teacher from Mexico.',
      posts_counter: 0
    )

    @post = Post.create(
      title: 'This is my first post',
      text: 'This is my first post text',
      likes_counter: 0,
      comments_counter: 0,
      author_id: @user.id
    )

    Like.create(
      author_id: @user.id,
      post_id: @post.id
    )
  end

  # Like method
  context '#update_like_counter' do
    it 'shoud increment likes_counter by 1' do
      expect(Post.find(@post.id).likes_counter).to eq 1
    end
  end
end
