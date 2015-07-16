about = [Faker::Lorem.sentence, "", Faker::Company.catch_phrase]
10.times { User.create(username: Faker::Internet.user_name, password: "peanuts", about: about.sample) }
30.times { Post.create(title: Faker::Lorem.sentence(3), link: Faker::Internet.url, user_id: User.all.sample.id) }
50.times {Comment.create(body: Faker::Lorem.sentence(10), user_id: User.all.sample.id, post_id: Post.all.sample.id) }
