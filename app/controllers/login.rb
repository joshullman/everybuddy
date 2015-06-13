get '/login' do
	erb :login
end

post '/login' do
	user = User.find_by(username: params[:username])
	if user.authenticate(params[:password])
		login(user)
		redirect '/'
	else
		erb :login
	end
end

get '/logout' do
	logout!
	redirect '/'
end