get "/" do
  erb :home
end

post "/results" do
  @events = []
  Event.all.each do |event|
    event.tags.each do |tag|
      @events << event if tag.name == params[:tag]
    end
  end

  if response.xhr?
  	erb :"_results", locals: {events: @events}, layout: false
  else
	  erb :results
	end
end