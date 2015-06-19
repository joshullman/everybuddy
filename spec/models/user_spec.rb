require 'spec_helper'

describe User do

	def create_user(name)
		User.create!(
			name: name,
			gender: name,
			username: name,
			email: "#{name}@example.org",
			password: 'password',
		)
	end

	it 'should have conversations' do
		bob   = create_user('bob')
		laura = create_user('laura')

		conversation = Conversation.create!(
			user_one: bob,
			user_two: laura,
		)

		message1 = Message.create!(
			conversation: conversation,
			user: bob,
			content: "Hey Laura, how is your face?"
		)

		expect(conversations.messages.reload).to include message1

	end

end