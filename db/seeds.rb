user = User.create(username: 'admin', password: 'password', password_confirmation: 'password', email: 'admin@example.com')

user2 = User.create(username: 'steve', password: 'password', password_confirmation: 'password', email: 'steve@example.com')

Spot.create(name: 'Spot 1', description: 'Spot sdfasd', user_id: user.id, category: 'Hiking', difficulty: 1)
Spot.create(name: 'Spot 2', description: 'Spot sdfasd', user_id: user.id, category: 'Hiking', difficulty: 1)
Spot.create(name: 'Spot 3', description: 'Spot sdfasd', user_id: user.id, category: 'Hiking', difficulty: 1)
Spot.create(name: 'Spot 4', description: 'Spot sdfasd', user_id: user.id, category: 'Hiking', difficulty: 1)
Spot.create(name: 'Spot 5', description: 'Spot sdfasd', user_id: user.id, category: 'Hiking', difficulty: 1)
Spot.create(name: 'Spot 6', description: 'Spot sdfasd', user_id: user.id, category: 'Hiking', difficulty: 1)
Spot.create(name: 'Spot 7', description: 'Spot sdfasd', user_id: user.id, category: 'Hiking', difficulty: 1)
Spot.create(name: 'Spot 8', description: 'Spot sdfasd', user_id: user.id, category: 'Hiking', difficulty: 1)
Spot.create(name: 'Spot 9', description: 'Spot sdfasd', user_id: user.id, category: 'Hiking', difficulty: 1)
Spot.create(name: 'Spot 10', description: 'Spot sdfasd', user_id: user.id, category: 'Hiking', difficulty: 1)
Spot.create(name: 'Spot 11', description: 'Spot sdfasd', user_id: user.id, category: 'Hiking', difficulty: 1)
Spot.create(name: 'Spot 12', description: 'Spot sdfasd', user_id: user.id, category: 'Hiking', difficulty: 1)
Spot.create(name: 'Spot 13', description: 'Spot sdfasd', user_id: user.id, category: 'Hiking', difficulty: 1)
Spot.create(name: 'Spot 14', description: 'Spot sdfasd', user_id: user.id, category: 'Hiking', difficulty: 1)

Like.create(spot_id: 1, user_id: 1)
Like.create(spot_id: 2, user_id: 1)
Like.create(spot_id: 3, user_id: 1)
Like.create(spot_id: 4, user_id: 1)
Like.create(spot_id: 5, user_id: 1)
Like.create(spot_id: 6, user_id: 1)
Like.create(spot_id: 7, user_id: 1)
Like.create(spot_id: 8, user_id: 1)
Like.create(spot_id: 9, user_id: 1)
Like.create(spot_id: 10, user_id: 1)
Like.create(spot_id: 11, user_id: 1)
Like.create(spot_id: 12, user_id: 1)
Like.create(spot_id: 13, user_id: 1)
Like.create(spot_id: 14, user_id: 1)

Comment.create(spot_id: 1, user_id: 1, body: 'this is a test', category: 'Hiking', difficulty: 1)
Comment.create(spot_id: 2, user_id: 1, body: 'this is a test', category: 'Hiking', difficulty: 1)
Comment.create(spot_id: 3, user_id: 1, body: 'this is a test', category: 'Hiking', difficulty: 1)
Comment.create(spot_id: 4, user_id: 1, body: 'this is a test', category: 'Hiking', difficulty: 1)
Comment.create(spot_id: 5, user_id: 1, body: 'this is a test', category: 'Hiking', difficulty: 1)
Comment.create(spot_id: 6, user_id: 1, body: 'this is a test', category: 'Hiking', difficulty: 1)
Comment.create(spot_id: 7, user_id: 1, body: 'this is a test', category: 'Hiking', difficulty: 1)
Comment.create(spot_id: 8, user_id: 1, body: 'this is a test', category: 'Hiking', difficulty: 1)
Comment.create(spot_id: 9, user_id: 1, body: 'this is a test', category: 'Hiking', difficulty: 1)
Comment.create(spot_id: 10, user_id: 1, body: 'this is a test', category: 'Hiking', difficulty: 1)
Comment.create(spot_id: 11, user_id: 1, body: 'this is a test', category: 'Hiking', difficulty: 1)
Comment.create(spot_id: 12, user_id: 1, body: 'this is a test', category: 'Hiking', difficulty: 1)
Comment.create(spot_id: 13, user_id: 1, body: 'this is a test', category: 'Hiking', difficulty: 1)
Comment.create(spot_id: 14, user_id: 1, body: 'this is a test', category: 'Hiking', difficulty: 1)



Spot.create(name: 'Spot 1', description: 'Spot sdfasd', user_id: user2.id)
Spot.create(name: 'Spot 2', description: 'Spot sdfasd', user_id: user2.id)
Spot.create(name: 'Spot 3', description: 'Spot sdfasd', user_id: user2.id)
Spot.create(name: 'Spot 4', description: 'Spot sdfasd', user_id: user2.id)
Spot.create(name: 'Spot 5', description: 'Spot sdfasd', user_id: user2.id)
Spot.create(name: 'Spot 6', description: 'Spot sdfasd', user_id: user2.id)
Spot.create(name: 'Spot 7', description: 'Spot sdfasd', user_id: user2.id)
Spot.create(name: 'Spot 8', description: 'Spot sdfasd', user_id: user2.id)
Spot.create(name: 'Spot 9', description: 'Spot sdfasd', user_id: user2.id)
Spot.create(name: 'Spot 10', description: 'Spot sdfasd', user_id: user2.id)
Spot.create(name: 'Spot 11', description: 'Spot sdfasd', user_id: user2.id)
Spot.create(name: 'Spot 12', description: 'Spot sdfasd', user_id: user2.id)
Spot.create(name: 'Spot 13', description: 'Spot sdfasd', user_id: user2.id)
Spot.create(name: 'Spot 14', description: 'Spot sdfasd', user_id: user2.id)

Like.create(spot_id: 1, user_id: 2)
Like.create(spot_id: 2, user_id: 2)
Like.create(spot_id: 3, user_id: 2)
Like.create(spot_id: 4, user_id: 2)
Like.create(spot_id: 5, user_id: 2)
Like.create(spot_id: 6, user_id: 2)
Like.create(spot_id: 7, user_id: 2)
Like.create(spot_id: 8, user_id: 2)
Like.create(spot_id: 9, user_id: 2)
Like.create(spot_id: 10, user_id: 2)
Like.create(spot_id: 11, user_id: 2)
Like.create(spot_id: 12, user_id: 2)
Like.create(spot_id: 13, user_id: 2)
Like.create(spot_id: 14, user_id: 2)

Comment.create(spot_id: 1, user_id: 2, body: 'this is a test')
Comment.create(spot_id: 2, user_id: 2, body: 'this is a test')
Comment.create(spot_id: 3, user_id: 2, body: 'this is a test')
Comment.create(spot_id: 4, user_id: 2, body: 'this is a test')
Comment.create(spot_id: 5, user_id: 2, body: 'this is a test')
Comment.create(spot_id: 6, user_id: 2, body: 'this is a test')
Comment.create(spot_id: 7, user_id: 2, body: 'this is a test')
Comment.create(spot_id: 8, user_id: 2, body: 'this is a test')
Comment.create(spot_id: 9, user_id: 2, body: 'this is a test')
Comment.create(spot_id: 10, user_id: 2, body: 'this is a test')
Comment.create(spot_id: 11, user_id: 2, body: 'this is a test')
Comment.create(spot_id: 12, user_id: 2, body: 'this is a test')
Comment.create(spot_id: 13, user_id: 2, body: 'this is a test')
Comment.create(spot_id: 14, user_id: 2, body: 'this is a test')
