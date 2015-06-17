#all
get	"/users/:user_id/conversations" do
	@conversations = []
	@conversations << current_user.sent_convos
	@conversations << current_user.received_convos
	@conversations.flatten
	@conversations.order(created_at: :desc)
	erb :"conversations/index"
end

#new
get	"/users/:user_id/conversations/new" do
	@user = User.find(params[:user_id])
	@records = []
	first = Conversation.where(sender: params[:user_id])
	second = Conversation.where(receiver: params[:user_id])
	@records << first
	@records << second
  @conversation = Conversation.new
  @message = Message.new
  erb :"conversations/new"
end

#create
post	"/users/:user_id/conversations" do
	@conversation = Conversation.new(sender: current_user.id, receiver: params[:user_id], title: params[:title])
	if @conversation.save
		@message = Message.new(conversation_id: @conversation.id, user_id: current_user.id, content: params[:content])
	else
		status 400
    erb :"conversations/new"
  end

  if @message.save
    redirect "/users/#{current_user.id}/conversations/#{@conversation.id}"
  else
  	status 400
    erb :"conversations/new"
  end
end

#show
get	"/users/:user_id/conversations/:conversation_id" do
	@conversation = Conversation.find(params[:conversation_id])
	@messages = @conversation.messages
	@new_message = Message.new
	erb :"conversations/show"
end


# #delete
delete '/users/:user_id/conversations/:conversation_id' do
	@conversation = Conversation.find(params[:conversation_id])
	  if @conversation
	    @conversation.destroy
	  else
	    status 404
	    "Conversation not found"
	  end
	  redirect "/users/:user_id/conversations"
end

post	"/users/:user_id/conversations/:conversation_id/message" do
	p params[:conversation_id]
	@message = Message.new(conversation_id: params[:conversation_id], user_id: current_user.id, content: params[:content])
  if @message.save
    redirect "/users/#{current_user.id}/conversations/#{@message.conversation_id}"
  else
  	status 400
    erb :"conversations/new"
  end
end