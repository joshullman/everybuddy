#all accepted
get	"/users/:user_id/buddies" do
  @user = User.find(params[:user_id])
  @buddies = @user.accepted_buddies
	erb :"buddies/index"
end

#pending
get "/users/:user_id/buddies/pending" do
  @user = User.find(params[:user_id])
  @buddies = @user.pending_buddies
  erb :"buddies/pending"
end

#requests
get "/users/:user_id/buddies/requests" do
  @user = User.find(params[:user_id])
  @buddies = @user.buddy_requests
  erb :"buddies/requests"
end

# create/accept new friend
post "/users/:user_id/buddies/:buddy_id/new" do
  @buddy_rel = BuddyRelationship.where(user_id: params[:buddy_id], buddy_id: current_user.id).first || 
               BuddyRelationship.where(user_id: current_user.id, buddy_id: params[:buddy_id]).first
  @buddy_rel[:accepted] = true
  if @buddy_rel.save
    redirect "/users/#{current_user.id}/buddies"
  else
    "I GOT AN ERROR D:"
  end
end

#create/invite new friend
post "/users/:user_id/buddies" do
  BuddyRelationship.create(user_id: current_user.id, buddy_id: params[:user_id])
  redirect "/users/#{params[:user_id]}"
end

# #destroy
delete	"/users/:user_id/buddies/:buddy_id/delete" do
  @buddy = BuddyRelationship.where(user_id: params[:buddy_id], buddy_id: current_user.id).first || 
           BuddyRelationship.where(user_id: current_user.id, buddy_id: params[:buddy_id]).first
  @buddy.destroy
  p "Removed Buddy"
  redirect "/users/#{params[:user_id]}/buddies"
end

delete  "/users/:user_id/buddies/:buddy_id" do
  @buddy = BuddyRelationship.where(user_id: params[:buddy_id], buddy_id: current_user.id).first || 
           BuddyRelationship.where(user_id: current_user.id, buddy_id: params[:buddy_id]).first
  @buddy.destroy
  p "Removed Buddy"
  redirect "/users/#{params[:buddy_id]}"
end
