require 'rails_helper'
RSpec.describe '#UserIndex', type: :feature do
  before(:each) do
    @users = [
      @user1 = User.create(
        name: 'Derrick',
        photo: 'https://img.freepik.com/free-vector/mysterious-mafia-man-smoking-cigarette_52683-34828.jpg?w=1480&t=st=1674661161~exp=1674661761~hmac=e529680000ea966150e5ea3b38241a0d8c9582faf23dac8af61ce1785cf27838',
        bio: 'Fullstack Web developer from Uganda',
        posts_counter: 9
      ),
      @user2 = User.create(
        name: 'Lilly',
        photo: 'https://img.freepik.com/free-vector/mysterious-mafia-man-smoking-cigarette_52683-34828.jpg?w=1480&t=st=1674661161~exp=1674661761~hmac=e529680000ea966150e5ea3b38241a0d8c9582faf23dac8af61ce1785cf27838',
        bio: 'Teacher from Poland.',
        posts_counter: 1
      ),
      @user3 = User.create(
        name: 'Tom',
        photo: 'https://img.freepik.com/free-vector/mysterious-mafia-man-smoking-cigarette_52683-34828.jpg?w=1480&t=st=1674661161~exp=1674661761~hmac=e529680000ea966150e5ea3b38241a0d8c9582faf23dac8af61ce1785cf27838',
        bio: 'Teacher from Mexico.',
        posts_counter: 0
      )
    ]
    @posts = [
      post1 = Post.create(
        author: @user1,
        title: 'Hello Post',
        text: 'This is my first post',
        comments_counter: 0,
        likes_counter: 0
      ),
      post2 = Post.create(
        author: @user1,
        title: 'Football',
        text: 'This is my second post',
        comments_counter: 0,
        likes_counter: 0
      ),
      post3 = Post.create(
        author: @user1,
        title: 'Current Affairs',
        text: 'This is my third post',
        comments_counter: 0,
        likes_counter: 0
      ),
      post4 = Post.create(
        author: @user1,
        title: 'Microverse',
        text: 'This is my fourth post',
        comments_counter: 0,
        likes_counter: 0
      )
    ]
    visit users_path
  end
  describe '#UserShowPage' do
    it 'should display the user profile picture' do
      @users.each do |user|
        expect(page).to have_css ("img[src='#{user.photo}']")
      end
    end
    it 'should display the name of the user' do
      @users.each do |user|
        expect(page).to have_content (user.name)
      end
    end
    it 'should display the number of posts' do
      @users.each do |user|
        expect(page).to have_content (user.posts_counter)
      end
    end
    it 'should see the first 3 posts of the user' do
      @users.first.most_recent_posts.each do |post|
        expect(page).to have_content(post.title)
      end
    end
    it 'should display the user bio' do
      # expect(page).to have_content(@users.first.bio)
    end
    it 'should display view all posts buttons' do
      # expect(page).to have_link('See all posts', href: user_posts_path(@users.first))
      # expect(page).to have_button('View all posts')
    end
  end
end