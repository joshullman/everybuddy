get "/login" do
	erb :login
end

post "/login" do
	@user = User.find_by(username: params[:identifier]) || @user = User.find_by(email: params[:identifier])
	if @user.password == (params[:password])
		login(@user)
		redirect "/users/#{current_user.id}"
	else
		erb :login
	end
end

get "/logout" do
	logout!
	redirect "/"
end
