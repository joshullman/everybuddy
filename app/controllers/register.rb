get '/register' do
	erb :register
end

post '/register' do
	@user = User.new(params[:user])
	if @user.save
		login(user)
		redirect "/"
	else
		status 400
		erb :register
	end
end