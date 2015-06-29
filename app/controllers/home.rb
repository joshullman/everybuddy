get "/" do
  erb :home
end

post "/results" do
  @tag = Tag.where(name: params[:tag]).first
  @events = @tag.events.where("events.receiver_id = 0 AND events.accepted = false")
  if request.xhr?
  	erb :"_results", layout: false, locals: {events: @events, search_tag: @tag}
  else
	  erb :home
	end
end