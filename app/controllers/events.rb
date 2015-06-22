#all
get	"users/:user_id/events" do
	@events = User.find(:user_id).events
	erb :"events/index"
end

#new
get	"/events/new" do
	@user = User.find(current_user.id)
  @event = Event.new
  erb :"events/new"
end

#create
post "/events" do
	@event = Event.new(poster: current_user.id)
	@event.assign_attributes(params[:event])
	if @event.save
		redirect "/events/#{@event.id}"
	else
		status 400
    erb :"events/new"
  end
end

#show
get	"/events/:event_id" do
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
    redirect "/events/#{@event.id}"
  else
    status 401
    erb :"events/edit"
  end
end

# #delete
delete "/events/:event_id" do
	@event = Event.find(params[:event_id])
	  if @event
	    @event.destroy
	  else
	    status 404
	    "Event not found"
	  end
	  redirect "/events"
end