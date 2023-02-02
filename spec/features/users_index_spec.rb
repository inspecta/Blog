require 'rails_helper'
RSpec.describe 'root page features' do
  before(:each) do
    @users = [
      @user1 = User.create(
        name: 'Derrick',
        photo: 'https://img.freepik.com/free-vector/mysterious-mafia-man-smoking-cigarette_52683-34828.jpg?w=1480&t=st=1674661161~exp=1674661761~hmac=e529680000ea966150e5ea3b38241a0d8c9582faf23dac8af61ce1785cf27838',
        bio: 'Fullstack Web developer from Uganda',
        posts_counter: 0
      ),
      @user2 = User.create(
        name: 'Lilly',
        photo: 'https://img.freepik.com/free-vector/mysterious-mafia-man-smoking-cigarette_52683-34828.jpg?w=1480&t=st=1674661161~exp=1674661761~hmac=e529680000ea966150e5ea3b38241a0d8c9582faf23dac8af61ce1785cf27838',
        bio: 'Teacher from Poland.',
        posts_counter: 0
      ),
      @user3 = User.create(
        name: 'Tom',
        photo: 'https://img.freepik.com/free-vector/mysterious-mafia-man-smoking-cigarette_52683-34828.jpg?w=1480&t=st=1674661161~exp=1674661761~hmac=e529680000ea966150e5ea3b38241a0d8c9582faf23dac8af61ce1785cf27838',
        bio: 'Teacher from Mexico.',
        posts_counter: 0
      )
    ]
    visit('/')
  end
  describe 'users#index' do
    it 'displays all the different usernames' do
      @users.each do |user|
        expect(page).to have_content(user.name)
      end
    end
    it 'display the profile picture for each user' do
      @users.each do |user|
        expect(page).to have_css("img[src='#{user.photo}']")
      end
    end
    it 'displays number of posts for each user' do
      @users.each do |user|
        expect(page).to have_content("Number of posts: #{user.posts_counter}")
      end
    end
  end
end
