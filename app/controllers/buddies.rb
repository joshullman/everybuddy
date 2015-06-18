#all accepted
get	"/users/:user_id/buddies" do
  @user = User.find(params[:user_id])
  if @buddies = @user.accepted_buddies
	 erb :"buddies/index"
  else
    "You have no buddies!"
  end
end

#pending
get "/users/:user_id/buddies/pending" do
  @user = User.find(params[:user_id])
  @buddies = @user.pending_buddies
  erb :"buddies/index"
end

#requests
get "/users/:user_id/buddies/requests" do
  @user = User.find(params[:user_id])
  @buddies = @user.requesting_buddies
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
  @buddy = current_user.buddies.find_by(user_id: params[:user_id]) || current_user.buddies.find_by(buddy_id: params[:user_id])
  @buddy.destroy
  flash[:notice] = "Removed Buddy"
  redirect "/users/:user_id/buddies"
end
