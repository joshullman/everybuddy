#new
post "/users/new" do
  erb :"users/new"
end

#create
post "/users" do
  @user = User.new(params[:user])
  if @user.save
    login(@user)
    redirect "/"
  else
    p @user.errors
    status 400
    erb :"users/new"
  end
end

#show
get "/users/:id" do
  @user = User.find_by(id: params[:id])
  if @user
    erb :"users/show"
  else
    status 404
    redirect "/"
  end
end

#edit
get "/users/:id/edit" do
  @user = User.find(session[:user_id])
  if @user
    erb :"users/edit"
  else
    status 404
    "User Not Found"
  end
end

#update
put "/users/:id" do
  @user = User.find(session[:user_id])
  @user.assign_attributes(params[:user])
  if @user.save
    redirect "/users/#{@user.id}"
  else
    status 401
    erb :"users/edit"
  end
end

#delete
delete "/users/:id" do
  @user = User.find(params[:id])
    if @user
      @user.destroy
    else
      status 404
      "User not found"
    end
    redirect "/"
end


