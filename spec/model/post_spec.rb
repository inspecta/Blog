require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    @user = User.create(
      name: 'Tom',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Teacher from Mexico.',
      posts_counter: 0
    )

    Post.new(
      title: 'Hello',
      text: 'This is my first post',
      likes_counter: 0,
      comments_counter: 0,
      author_id: @user.id
    )
  end

  before { subject.save }

  # Validations
  context '#posts title validation' do
    it 'post title should be present' do
      subject.title = nil
      expect(subject).not_to be_valid
    end
  end

  context '#posts commment counter validation' do
    it 'post_counter must be an integer >= 0' do
      subject.comments_counter = -11
      expect(subject).not_to be_valid

      subject.comments_counter = 11
      expect(subject).to be_valid
    end
  end

  context '#post likes counter validation' do
    it 'likes_counter must be an integer >= 0' do
      subject.likes_counter = -2
      expect(subject).not_to be_valid
    end
  end

  # Methods
  before :all do
    @user = User.create(
      name: 'Tom',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Teacher from Mexico.',
      posts_counter: 0
    )

    @post = Post.create(
      title: 'Hello',
      text: 'This is my first post',
      comments_counter: 0,
      likes_counter: 0,
      author_id: @user.id
    )

    10.times.collect do
      Comment.create(
        text: 'This is my comment',
        author_id: @user.id,
        post_id: @post.id
      )
    end
  end

  context '#update_posts_counter' do
    it 'should increment the posts_counter by 1' do
      expect(User.find(@user.id).posts_counter).to eq 1
    end
  end

  context '#most_recent_comments' do
    it 'should return most recent comments (5)' do
      expect(@post.most_recent_comments.length).to eq 5
    end
  end
end
