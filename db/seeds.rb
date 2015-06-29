require 'faker'

User.create(name: "Josh Ullman", gender: "M", email: "a@aol.com", username: "CaptainPlanet", password: "password")
User.create(name: "Alex Cusack", gender: "M", email: "b@aol.com", username: "Kuzy", password: "password")
User.create(name: "David Grotting", gender: "M", email: "c@aol.com", username: "BuffaloKing", password: "password")
User.create(name: "Vivek Poola", gender: "M", email: "d@aol.com", username: "TheWizard", password: "password")
User.create(name: "Arielle Chen", gender: "F", email: "e@aol.com", username: "Banana", password: "password")
User.create(name: "Le Tran", gender: "F", email: "f@aol.com", username: "BlackWidow", password: "password")
User.create(name: "Eric Saxman", gender: "M", email: "g@aol.com", username: "TheSaxMan", password: "password")
User.create(name: "Carissa Blossom", gender: "F", email: "h@aol.com", username: "Carissi", password: "password")
User.create(name: "Ellis Marte", gender: "M", email: "i@aol.com", username: "Chompy", password: "password")
User.create(name: "James Newman", gender: "M", email: "j@aol.com", username: "WolfMan", password: "password")
User.create(name: "Mike Farr", gender: "M", email: "k@aol.com", username: "MasterMike", password: "password")
User.create(name: "Travis S", gender: "M", email: "l@aol.com", username: "WhitePearl", password: "password")
User.create(name: "Alex Kass", gender: "M", email: "m@aol.com", username: "Kassanova", password: "password")
User.create(name: "Patrick Betti", gender: "M", email: "n@aol.com", username: "Scoobs", password: "password")
User.create(name: "Jeff Chang", gender: "M", email: "o@aol.com", username: "Chefe", password: "password")
User.create(name: "Andrew Donato", gender: "M", email: "p@aol.com", username: "TheAdmiral", password: "password")
User.create(name: "Jennifer Jaochico", gender: "F", email: "q@aol.com", username: "Jenga", password: "password")
User.create(name: "Ian Harris", gender: "M", email: "r@aol.com", username: "Banner", password: "password")
User.create(name: "Brian Kennedy", gender: "M", email: "s@aol.com", username: "BigKahuna", password: "password")
User.create(name: "Benoit Demonsant", gender: "M", email: "t@aol.com", username: "BennyAndTheJets", password: "password")
User.create(name: "Diana Lozano", gender: "F", email: "u@aol.com", username: "TheDragon", password: "password")
User.create(name: "Eric Flores", gender: "M", email: "v@aol.com", username: "EZE", password: "password")
User.create(name: "Henry Vega", gender: "M", email: "w@aol.com", username: "ActionHank", password: "password")
User.create(name: "Karan Aditya", gender: "M", email: "x@aol.com", username: "TheMatador", password: "password")
User.create(name: "Kelvin Gann", gender: "M", email: "y@aol.com", username: "SubZero", password: "password")
User.create(name: "Nicholas Toulouse", gender: "M", email: "z@aol.com", username: "WildCard", password: "password")
User.create(name: "Tanay Arora", gender: "M", email: "tasty@aol.com", username: "Tasty", password: "password")
User.create(name: "Staunton Sample", gender: "M", email: "karatekid@aol.com", username: "KarateKid", password: "password")
User.create(name: "Erica Prenga", gender: "F", email: "thesavior@aol.com", username: "Boomer", password: "password")
User.create(name: "Tom Tom", gender: "M", email: "tom@aol.com", username: "TomTom", password: "password")
User.create(name: "Brick Thornton", gender: "M", email: "brick@aol.com", username: "BrickThorn", password: "password")
User.create(name: "Hunter Chapman", gender: "M", email: "hunter@aol.com", username: "ChampMan", password: "password")
User.create(name: "Jared Grippe", gender: "M", email: "jumpy@aol.com", username: "FrogPrince", password: "password")

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
Tag.create(name: "tennis")
Tag.create(name: "basketball")
Tag.create(name: "golfing")
Tag.create(name: "snowboarding")
Tag.create(name: "fishing")
Tag.create(name: "coffee")
Tag.create(name: "museum")
Tag.create(name: "sporting event")
Tag.create(name: "workout")
Tag.create(name: "movie")
Tag.create(name: "skating")
Tag.create(name: "dancing")
Tag.create(name: "clubbing")
Tag.create(name: "scuba diving")
Tag.create(name: "beach")
Tag.create(name: "aquarium")
Tag.create(name: "zoo")
Tag.create(name: "go-kart")
Tag.create(name: "theme park")
Tag.create(name: "minigolf")

Conversation.create(sender: 1, receiver: 2, title: "Hey")
Conversation.create(sender: 1, receiver: 33, title: "FRAWGS")
Conversation.create(sender: 5, receiver: 18, title: "How about them murder buddies")
Conversation.create(sender: 2, receiver: 1, title: "How weird")
Conversation.create(sender: 33, receiver: 1, title: "PAAAAAANDAS")
Message.create(conversation_id: 1, user_id: 1, content: "What's up?")
Message.create(conversation_id: 1, user_id: 2, content: "Nothing much, you?")
Message.create(conversation_id: 1, user_id: 1, content: "Just watching Jared lecture")
Message.create(conversation_id: 1, user_id: 1, content: "Frogs4lyfe")
Message.create(conversation_id: 2, user_id: 1, content: "What's up?")
Message.create(conversation_id: 2, user_id: 33, content: "Nothing much, you?")
Message.create(conversation_id: 2, user_id: 1, content: "Just watching Jared lecture")
Message.create(conversation_id: 2, user_id: 1, content: "Frogs4lyfe")
Message.create(conversation_id: 3, user_id: 5, content: "MURDER TRAAAAAAAIN")
Message.create(conversation_id: 4, user_id: 2, content: "let's see if this works")
Message.create(conversation_id: 4, user_id: 1, content: "Does it?")
Message.create(conversation_id: 5, user_id: 33, content: "Aren't they just the cutest thing ever?")
Message.create(conversation_id: 5, user_id: 1, content: "b^_^d")

40.times do
	a = (1 + rand(33))
	b = (1 + rand(33))
	Conversation.create(sender: a, receiver: b, title: Faker::Lorem.word) if a != b
	5.times do
		c = Conversation.last.id
		d = (1 + rand(2))
		d == 1 ? d = a : d = b
		Message.create(conversation_id: c, user_id: d, content: Faker::Lorem.sentence) if a != b
	end
end

##############################################

40.times do
	a = (1 + rand(33))
	b = (1 + rand(33))
	if a != b && !BuddyRelationship.where(user_id: a, buddy_id: b).first && 
							 !BuddyRelationship.where(user_id: b, buddy_id: a).first
		BuddyRelationship.create(user_id: a, buddy_id: b)
	end
end

80.times do
	a = (1 + rand(33))
	b = (1 + rand(33))
	if a != b && !BuddyRelationship.where(user_id: a, buddy_id: b).first && 
							 !BuddyRelationship.where(user_id: b, buddy_id: a).first
		BuddyRelationship.create(user_id: a, buddy_id: b, accepted: true)
	end
end

##############################################

40.times do
	a = (1 + rand(33))
	b = (1 + rand(33))
	c = (rand(2))
	c == 1 ? c = true : c = false
	if a != b && !Event.where(poster_id: a, receiver_id: b).first && !Event.where(poster_id: b, receiver_id: a).first
		Event.create(
			poster_id: a, 
			receiver_id: b, 
			name: "WANNA HANG OOT?", 
			description: "FREAKIN SWEET",
			time: "TOMORROW", 
			location: "DBC", 
			is_private: c
		)
	end
end

20.times do
	a = (1 + rand(33))
	b = (1 + rand(33))
	c = (rand(2))
	c == 1 ? c = true : c = false
	if a != b && !Event.where(poster_id: a, receiver_id: b).first && !Event.where(poster_id: b, receiver_id: a).first
		Event.create(
			poster_id: a, 
			receiver_id: b, 
			name: "CONFIRMED HANG SESH BRUH", 
			description: "AWESOME",
			time: "TOMORROW", 
			location: "DBC", 
			is_private: c, 
			accepted: true
		)
	end
end


60.times do
	a = (1 + rand(33))
	Event.create(
		poster_id: a, 
		name: "I AM SO LONELY", 
		description: "PLEASE LOVE ME",
		time: "TOMORROW", 
		location: "DBC", 
		is_private: false
	)
end

100.times do
  a = (1 + rand(100))
  b = (1 + rand(40))
  EventTag.create(event_id: a, tag_id: b) if !EventTag.where(event_id: a, tag_id: b).first
end
