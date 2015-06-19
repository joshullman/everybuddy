#all
get	"/conversations" do
	@conversations = current_user.conversations
	erb :"conversations/index"
end

#new
get	"/users/:user_id/conversations/new" do
	@user = User.find(params[:user_id])
	@records = current_user.conversations_with(params[:user_id])
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
    redirect "/conversations/#{@conversation.id}"
  else
  	status 400
    erb :"conversations/new"
  end
end

#show
get	"/conversations/:conversation_id" do
	@conversation = Conversation.find(params[:conversation_id])
	@messages = @conversation.messages
	@new_message = Message.new
	erb :"conversations/show"
end


# #delete
delete '/conversations/:conversation_id' do
	@conversation = Conversation.find(params[:conversation_id])
	  if @conversation
	    @conversation.destroy
	  else
	    status 404
	    "Conversation not found"
	  end
	  redirect "/conversations"
end

post	"/conversations/:conversation_id/message" do
	@message = Message.new(conversation_id: params[:conversation_id], user_id: current_user.id, content: params[:content])
  if @message.save
    redirect "conversations/#{@message.conversation_id}"
  else
  	status 400
    erb :"conversations/new"
  end
end
