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
        bio: 'Teacher from Poland.', posts_counter: 1
      )
    ]

    @posts = [
      @post1 = Post.create(
        author: @user1, title: 'Hello Post', text: 'This is my first post', comments_counter: 0, likes_counter: 0
      ),
      @post2 = Post.create(
        author: @user1, title: 'Football', text: 'This is my second post', comments_counter: 0, likes_counter: 0
      ),
      @post3 = Post.create(
        author: @user1, title: 'Current Affairs', text: 'This is my third post', comments_counter: 0, likes_counter: 0
      )
    ]

    @comments = [
      Comment.create(post: @post1, author: @user1, text: 'Hi Tom!'),
      Comment.create(post: @post2, author: @user2, text: 'Great stuff.'),
      Comment.create(post: @post3, author: @user2, text: 'Awesome!')
    ]

    visit user_posts_path(@users.first, @posts.first)
  end

  describe 'Post#Index' do
    it 'shoud display the users profile picture' do
      expect(page).to have_css("img[src='#{@users.first.photo}']")
    end

    it 'shoudl display the user name' do
      expect(page).to have_content(@users.first.name)
    end

    it 'should display the number of posts' do
      expect(page).to have_content(@users.first.posts_counter)
    end

    it 'should display the post title' do
      expect(page).to have_content(@posts.first.title)
    end

    it 'should display the body of the post' do
      expect(page).to have_content(@posts.first.text)
    end

    it 'should display the first comments of the post' do
      @posts.first.comments.each do |comment|
        expect(page).to have_content(comment.text)
      end
    end

    it 'should display the number of comments of the post' do
      expect(page).to have_content(@posts.first.comments_counter)
    end

    it 'should display the number of likes of the post' do
      expect(page).to have_content(@posts.first.likes_counter)
    end

    it 'should include a section for paginations' do
      expect(page).to have_content('Pagination')
    end
  end
end
