# Users
user1 = User.create(name: 'Derrick', 
photo: 'https://img.freepik.com/free-vector/mysterious-mafia-man-smoking-cigarette_52683-34828.jpg?w=1480&t=st=1674661161~exp=1674661761~hmac=e529680000ea966150e5ea3b38241a0d8c9582faf23dac8af61ce1785cf27838',
bio: 'Fullstack Web developer from Uganda', posts_counter: 0)

user2 = User.create(name: 'Lilly', photo: 'https://img.freepik.com/free-vector/mysterious-mafia-man-smoking-cigarette_52683-34828.jpg?w=1480&t=st=1674661161~exp=1674661761~hmac=e529680000ea966150e5ea3b38241a0d8c9582faf23dac8af61ce1785cf27838', bio: 'Teacher from Poland.', posts_counter: 0)

user3 = User.create(name: 'Tom', photo: 'https://img.freepik.com/free-vector/mysterious-mafia-man-smoking-cigarette_52683-34828.jpg?w=1480&t=st=1674661161~exp=1674661761~hmac=e529680000ea966150e5ea3b38241a0d8c9582faf23dac8af61ce1785cf27838', bio: 'Teacher from Mexico.', posts_counter: 0)

# Posts
post1 = Post.create(author: user1, title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0)

post2 = Post.create(author: user2, title: 'Hello', text: 'This is my second post', comments_counter: 0, likes_counter: 0)

post3 = Post.create(author: user3, title: 'Hello', text: 'This is my third post', comments_counter: 0, likes_counter: 0)

post4 = Post.create(author: user1, title: 'Welcome', text: 'Please feel at home', comments_counter: 0, likes_counter: 0)

# Comments

Comment.create(post: post1, author: user2, text: 'Hi Tom!' )
Comment.create(post: post2, author: user1, text: 'Great stuff.' )
Comment.create(post: post1, author: user3, text: 'Keet it up!' )
Comment.create(post: post3, author: user1, text: 'Bruhhhhhh!' )
Comment.create(post: post2, author: user2, text: 'Awesome!' )
Comment.create(post: post4, author: user1, text: 'Wooooooooow!' )





