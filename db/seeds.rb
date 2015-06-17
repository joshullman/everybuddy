User.create(first_name: "Josh", last_name: "Ullman", email: "a@aol.com", username: "CaptainPlanet", password: "password")
User.create(first_name: "Alex", last_name: "Cusack", email: "b@aol.com", username: "Kuzy", password: "password")
User.create(first_name: "David", last_name: "Grotting", email: "c@aol.com", username: "BuffaloKing", password: "password")
User.create(first_name: "Vivek", last_name: "Poola", email: "d@aol.com", username: "TheWizard", password: "password")
User.create(first_name: "Arielle", last_name: "Chen", email: "e@aol.com", username: "Banana", password: "password")
User.create(first_name: "Le", last_name: "Tran", email: "f@aol.com", username: "BlackWidow", password: "password")
User.create(first_name: "Eric", last_name: "Saxman", email: "g@aol.com", username: "TheSaxMan", password: "password")
User.create(first_name: "Carissa", last_name: "Blossom", email: "h@aol.com", username: "Carissi", password: "password")
User.create(first_name: "Ellis", last_name: "Marte", email: "i@aol.com", username: "Chompy", password: "password")
User.create(first_name: "James", last_name: "Newman", email: "j@aol.com", username: "WolfMan", password: "password")
User.create(first_name: "Mike", last_name: "Farr", email: "k@aol.com", username: "MasterMike", password: "password")
User.create(first_name: "Travis", last_name: "S", email: "l@aol.com", username: "WhitePearl", password: "password")
User.create(first_name: "Alex", last_name: "Kass", email: "m@aol.com", username: "Kassanova", password: "password")
User.create(first_name: "Patrick", last_name: "Betti", email: "n@aol.com", username: "Scoobs", password: "password")
User.create(first_name: "Jeff", last_name: "Chang", email: "o@aol.com", username: "Chefe", password: "password")
User.create(first_name: "Andrew", last_name: "Donato", email: "p@aol.com", username: "TheAdmiral", password: "password")
User.create(first_name: "Jennifer", last_name: "Jaochico", email: "q@aol.com", username: "Jenga", password: "password")
User.create(first_name: "Ian", last_name: "Harris", email: "r@aol.com", username: "Banner", password: "password")
User.create(first_name: "Brian", last_name: "Kennedy", email: "s@aol.com", username: "BigKahuna", password: "password")
User.create(first_name: "Benoit", last_name: "Demonsant", email: "t@aol.com", username: "BennyAndTheJets", password: "password")
User.create(first_name: "Diana", last_name: "Lozano", email: "u@aol.com", username: "TheDragon", password: "password")
User.create(first_name: "Eric", last_name: "Flores", email: "v@aol.com", username: "EZE", password: "password")
User.create(first_name: "Henry", last_name: "Vega", email: "w@aol.com", username: "ActionHank", password: "password")
User.create(first_name: "Karan", last_name: "Aditya", email: "x@aol.com", username: "TheMatador", password: "password")
User.create(first_name: "Kelvin", last_name: "Gann", email: "y@aol.com", username: "SubZero", password: "password")
User.create(first_name: "Nicholas", last_name: "Toulouse", email: "z@aol.com", username: "WildCard", password: "password")
User.create(first_name: "Tanay", last_name: "Arora", email: "tasty@aol.com", username: "Tasty", password: "password")
User.create(first_name: "Staunton", last_name: "Sample", email: "karatekid@aol.com", username: "KarateKid", password: "password")
User.create(first_name: "Erica", last_name: "Prenga", email: "thesavior@aol.com", username: "Boomer", password: "password")
User.create(first_name: "Tom", last_name: "Tom", email: "tom@aol.com", username: "TomTom", password: "password")
User.create(first_name: "Brick", last_name: "Thornton", email: "brick@aol.com", username: "BrickThorn", password: "password")
User.create(first_name: "Hunter", last_name: "Chapman", email: "hunter@aol.com", username: "ChampMan", password: "password")
User.create(first_name: "Jared", last_name: "Grippe", email: "jumpy@aol.com", username: "FrogPrince", password: "password")

Tag.create(name: "hiking")
Tag.create(name: "surfing")
Tag.create(name: "murder")
Tag.create(name: "sexy time")
Tag.create(name: "concert")
Tag.create(name: "study")
Tag.create(name: "video game")
Tag.create(name: "mythical creature hunting")
Tag.create(name: "banana")
Tag.create(name: "wolfjob")
Tag.create(name: "rock climbing")
Tag.create(name: "parachuting")
Tag.create(name: "jogging")
Tag.create(name: "burrito")
Tag.create(name: "yoga")
Tag.create(name: "jam sesh")
Tag.create(name: "purgery")
Tag.create(name: "road trip")
Tag.create(name: "treason")
Tag.create(name: "shopping")

Conversation.create(sender: 1, receiver: 2, title: "Hey")
Conversation.create(sender: 1, receiver: 33, title: "Hey")
Conversation.create(sender: 5, receiver: 18, title: "Hey")
Message.create(conversation_id: 1, user_id: 1, content: "What's up?")
Message.create(conversation_id: 1, user_id: 2, content: "Nothing much, you?")
Message.create(conversation_id: 1, user_id: 1, content: "Just watching Jared lecture")
Message.create(conversation_id: 1, user_id: 1, content: "Frogs4lyfe")
Message.create(conversation_id: 2, user_id: 1, content: "What's up?")
Message.create(conversation_id: 2, user_id: 33, content: "Nothing much, you?")
Message.create(conversation_id: 2, user_id: 1, content: "Just watching Jared lecture")
Message.create(conversation_id: 2, user_id: 1, content: "Frogs4lyfe")
Message.create(conversation_id: 3, user_id: 5, content: "Frogs4lyfe")

75.times do
  a = (1 + rand(33))
  b = (1 + rand(20))
  UserTag.create(user_id: a, tag_id: b)
end


