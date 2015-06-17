# #all
# get	"/users/:user_id/messages" do
# 	@messages = Message.all
# 	erb :"messages/index"
# end

# #new
# get	"/users/:user_id/messages/new" do

# end

# #create
# post	"/users/:user_id/messages" do

# end

# #show
# get	"/users/:user_id/messages/message_:id" do

# end

# #destroy
# delete	"/users/:user_id/messages/message_:id" do

# end

# post	"/users/:user_id/conversations/:conversation_id/message" do
# 	p params[:conversation_id]
# 	@message = Message.new(conversation_id: params[:conversation_id], user_id: current_user.id, content: params[:content])
#   if @message.save
#     redirect "/users/#{current_user.id}/conversations/#{@message.conversation_id}"
#   else
#   	status 400
#     erb :"conversations/new"
#   end
# end