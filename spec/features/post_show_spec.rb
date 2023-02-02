require 'rails_helper'

RSpec.describe 'root page features' do
  before(:each) do
    @users = [
      @user1 = User.create(
        name: 'Derrick',
        photo: 'https://img.freepik.com/free-vector/mysterious-mafia-man-smoking-cigarette_52683-34828.jpg?w=1480&t=st=1674661161~exp=1674661761~hmac=e529680000ea966150e5ea3b38241a0d8c9582faf23dac8af61ce1785cf27838',
        bio: 'Fullstack Web developer from Uganda', posts_counter: 0
      ),
      @user2 = User.create(
        name: 'Lilly',
        photo: 'https://img.freepik.com/free-vector/mysterious-mafia-man-smoking-cigarette_52683-34828.jpg?w=1480&t=st=1674661161~exp=1674661761~hmac=e529680000ea966150e5ea3b38241a0d8c9582faf23dac8af61ce1785cf27838',
        bio: 'Teacher from Poland.', posts_counter: 0
      )
    ]

    @posts = [
      @post1 = Post.create(
        author: @user1,
        title: 'Hello',
        text: 'This is my first post',
        comments_counter: 0,
        likes_counter: 0
      ),
      @post2 = Post.create(
        author: @user2,
        title: 'Hello',
        text: 'This is my second post',
        comments_counter: 0,
        likes_counter: 0
      )
    ]

    visit user_posts_path(@users.first, @posts.first)
  end

  describe '#PostShowPage' do
    it 'Should display post title' do
      expect(page).to have_content(@posts.first.title)
    end

    it 'should display the post author' do
      expect(page).to have_content(@posts.first.author.name)
    end

    it 'should display the number of comments' do
      expect(page).to have_content(@posts.first.comments_counter)
    end

    it 'should display the number of likes' do
      expect(page).to have_content(@posts.first.likes_counter)
    end

    it 'should display the post body' do
      expect(page).to have_content(@posts.first.text)
    end

    it 'should display the name of the commentor' do
      @posts.first.comments.each do |comment|
        expect(page).to have_content(comment.author.name)
      end
    end
  end
end
