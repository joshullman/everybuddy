#all
get	"/users/:user_id/messages" do
	erb :messages
end

#new
get	"/users/:user_id/messages/new" do

end

#create
post	"/users/:user_id/messages" do

end

#show
get	"/users/:user_id/messages/message_:id" do

end

#destroy
delete	"/users/:user_id/messages/message_:id" do

end
