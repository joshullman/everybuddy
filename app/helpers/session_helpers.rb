helpers do
	
	def login(user)
		session[:user_id] = user.id
	end

	def logout!
		session[:user_id] = nil
	end

	def logged_in?
		!session[:user_id].nil?
	end

	def current_user
		if session[:user_id]
			User.where(id: session[:user_id]).first
		end
end