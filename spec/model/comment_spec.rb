require 'rails_helper'

RSpec.describe Comment, type: :model do
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

    Comment.create(
      author_id: @user.id,
      post_id: @post.id,
      text: 'This is my first post comment'
    )
  end

  # Validation
  context '#comments validation' do
    it 'comment text should be present' do
      subject.text = nil
      expect(subject).to_not be_valid
    end
  end

  # Update counter method
  context '#update_posts_counter' do
    it 'should increment the number of comments' do
      expect(Post.find(@post.id).comments_counter).to eq 1
    end
  end
end
