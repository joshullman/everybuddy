#show all buddies

#go to buddy's profile

#edit buddies

#delete buddies

#all
get	"/users/:user_id/buddies" do
  @user = User.find(params[:user_id])
  @buddies = @user.buddys
	erb :"buddies/index"
end

# #show
# get	"/users/:user_id/buddies/:buddy_id" do

# end

#create
post "/users/:user_id/buddies" do
  @buddy = current_user.buddies.new(user_id: current_user.id, buddy_id: params[:user_id])
  if @buddy.save
    # flash[:notice] = "Added friend."
    redirect "/users/#{params[:user_id]}"
  else
    # flash[:error] = "Unable to add friend."
    redirect "/users/#{params[:user_id]}"
  end
end

# #destroy
delete	"/users/:user_id/buddies" do
  @buddy = current_user.buddys.find(params[:user_id])
  @buddy.destroy
  flash[:notice] = "Removed Buddy"
  redirect "/users/:user_id/buddies"
end
