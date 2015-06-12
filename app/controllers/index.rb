get '/' do
  erb :index
end

# post '/' do
# 	@category = Category.new(
#     name: params[:name],
#     author_id: params[:author_id]
#     )
#   if @category.save
#     redirect "/search"
#   else
#     status 400
#     :"/"
#   end
# end

get '/login' do
	erb :login
end

post '/login' do
	user = User.find_by(username: params[:username])
	if user.authenticate(params[:password])
		session[:user_id] = user.user_id
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
end

get '/search' do
	redirect '/login' unless session[:user_id]
end
