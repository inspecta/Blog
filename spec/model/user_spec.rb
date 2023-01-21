require 'rails_helper'

RSpec.describe User, type: :model do
  before :all do
    @user = User.create(
      name: 'Tom',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Teacher from Mexico.',
      posts_counter: 1
    )

    7.times.collect do
      Post.create(
        title: 'my post title',
        text: 'My post text',
        comments_counter: 0,
        likes_counter: 0,
        author_id: @user.id
      )
    end
  end

  # Validations
  describe '#validations' do
    subject do
      User.new(
        name: 'Tom',
        photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
        bio: 'Teacher from Mexico.',
        posts_counter: 1
      )
    end

    before { subject.save }

    it 'name shoud be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'valid when posts_counter is less than 0' do
      subject.posts_counter = -1
      expect(subject).to_not be_valid
    end

    it 'valid when posts_counter is 0' do
      subject.posts_counter = 0
      expect(subject).to be_valid
    end
  end

  # Methods
  describe '#most_recent_posts' do
    it 'should return most recent posts #3' do
      expect(@user.most_recent_posts.length).to eq 3
    end
  end
end
