#show all buddies

#go to buddy's profile

#edit buddies

#delete buddies

#all
get	"/profile/:user_id/buddies" do
	erb :buddies
end

#show
get	"/profile/:user_id" do
	
end

#destroy
delete	"/profile/:user_id/buddies/:buddy_id" do
	
end