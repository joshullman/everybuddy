get '/results' do
	erb :results
end

post '/results' do
  p "*" * 90
  p params[:tag]
  p "*" * 90
  @users = []
  User.all.each do |user|
   user.tags.each do |tag|
     @users << user if tag.name == params[:tag]
   end
  end
  erb :results
end

#could be tags/
# tags/:id
# users.where id is id
