#show all buddies

#go to buddy's profile

#edit buddies

#delete buddies

#all
get	"/users/:user_id/buddies" do
	erb :buddies
end

#show
get	"/users/:user_id" do

end

#destroy
delete	"/users/:user_id/buddies/:buddy_id" do

end
