#all accepted
get	"/buddies" do
  @buddies = current_user.accepted_buddies
	erb :"buddies/index"
end

#pending
get "/buddies/pending" do
  @buddies = current_user.pending_buddies
  erb :"buddies/pending"
end

#requests
get "/buddies/requests" do
  @buddies = current_user.buddy_requests
  erb :"buddies/requests"
end

# create/accept new friend
post "/buddies/:buddy_id/new" do
  @buddy_rel = BuddyRelationship.where(user_id: params[:buddy_id], buddy_id: current_user.id).first || 
               BuddyRelationship.where(user_id: current_user.id, buddy_id: params[:buddy_id]).first
  @buddy_rel[:accepted] = true
  if @buddy_rel.save
    redirect "/buddies/requests"
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
delete	"/buddies/:buddy_id/delete" do
  @buddy_rel = BuddyRelationship.where(user_id: params[:buddy_id], buddy_id: current_user.id).first || 
               BuddyRelationship.where(user_id: current_user.id, buddy_id: params[:buddy_id]).first
  @buddy_rel.destroy
  redirect "/buddies"
end

delete  "/buddies/:buddy_id" do
  @buddy_rel = BuddyRelationship.where(user_id: params[:buddy_id], buddy_id: current_user.id).first || 
               BuddyRelationship.where(user_id: current_user.id, buddy_id: params[:buddy_id]).first
  @buddy_rel.destroy
  redirect "/buddies/requests"
end
