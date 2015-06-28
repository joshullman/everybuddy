get "/" do
  erb :home
end

post "/results" do
  p "*************" * 20
  p params
  p "*************" * 20
  @tag = Tag.where(name: params[:tag]).first
  @events = @tag.events
  if request.xhr?
  	p @tag
  	p @events
  	# content_type :json
  	erb :"_results", layout: false, locals: {events: @events, search_tag: @tag}
  else
	  erb :home
	end
end