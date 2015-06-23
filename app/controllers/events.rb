#all
get	"/users/:user_id/events" do
  if current_user.id == params[:user_id] 
  	@user = current_user
  	@events = current_user.events
  else
    @user = User.find(params[:user_id])
    @events = @user.pending_events.where(buddy: nil) + @user.accepted_events
  end
	erb :"events/index"
end

#pending
get "/events/pending" do
  @events = current_user.pending_events
  erb :"events/pending"
end

#requests
get "/events/requests" do
  @events = current_user.event_requests
  erb :"events/requests"
end

#new
get	"/events/new" do
	@user = User.find(current_user.id)
  @event = Event.new
  erb :"events/new"
end

# create/accept new event
post "/events/:event_id/new" do
  @event = Event.find(params[:event_id])
  @event[:accepted] = true
  if @event.save
    redirect "/events/requests"
  else
    "I GOT AN ERROR D:"
  end
end

post "/events/:event_id/accept" do
  @event = Event.find(params[:event_id])
  @event.update_attributes(buddy: current_user.id, accepted: true)
  redirect "/users/#{current_user.id}/events"
end

#create
post "/events" do
  @event = Event.new(poster: current_user.id)
  @event.assign_attributes(params[:event])
  if @event.save
    redirect "/users/#{current_user.id}/events/#{@event.id}"
  else
    status 400
    erb :"events/new"
  end
end

#show
get "/users/:user_id/events/:event_id" do
  @user = User.find(params[:user_id])
  @event = Event.find(params[:event_id])
  erb :"events/show"
end

#edit
get "/events/:event_id/edit" do
  @event = Event.find(params[:event_id])
  if @event
    erb :"events/edit"
  else
    status 404
    "Event Not Found"
  end
end

#update
put "/events/:event_id" do
  @event = Event.find(params[:event_id])
  @event.assign_attributes(params[:event])
  if @event.save
    redirect "/users/#{current_user.id}/events/#{@event.id}"
  else
    status 401
    erb :"events/edit"
  end
end

# #delete
delete "/events/:event_id/delete" do
  @event = Event.find(params[:event_id])
    if @event
      @event.destroy
    else
      status 404
      "Event not found"
    end
    redirect "/users/#{current_user.id}/events"
end

delete  "/events/:event_id" do
  @event = Event.find(params[:event_id])
  @event.destroy
  redirect "/events/requests"
end