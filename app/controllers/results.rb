get '/results' do
	erb :results
end

post '/results' do
  @users = []
  User.all.each do |user|
   user.tags.each do |tag|
     @users << user if tag.name == params[:tag]
   end
  end
  p @users
  erb :results
end

#could be tags/
# tags/:id
# users.where id is id
