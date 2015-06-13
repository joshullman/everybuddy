get '/results' do
	erb :results
end

post '/results' do
  p "I'm getting here!!!"
  p params.inspect
  @users = []
  a = User.all
  p a

  User.all.each do |user|
   user.tags.each do |tag|
     @users << user if tag.name == params[:tag]
   end
  end

  p @users
  erb :results
end
