User.create(first_name: "Josh", last_name: "Ullman", email: "boredoranges@yahoo.com", username: "theoscitator", password: "password")
Tag.create(name: "Hiking")
UserTag.create(user_id: 1, tag_id: 1)
