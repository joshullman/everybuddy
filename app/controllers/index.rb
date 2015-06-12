get '/' do
  erb :index
end

get '/login' do
	erb :login
end

post '/login' do
	user = User.find_by(username: params[:username])
	if user.authenticate(params[:password])
		session[:user_id] = user.id
		redirect '/search'
	else
		erb :login
	end
end

get '/logout' do
	session[:user_id] = nil
	redirect '/login'
end

get '/register' do
	erb :register
end

post '/register' do
	@user = User.new(params[:user])
	if @user.save
		session[:user_id] = user.id
		redirect "/search"
	else
		status 400
		erb :register
	end
end

get '/search' do
	redirect '/login' unless session[:user_id]
end
