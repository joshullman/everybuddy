#show
get "/profile" do
  @user = User.find(session[:user_id])
  if @user
    erb :"profile/index"
  else
    status 404
    redirect '/'
  end
end

#edit
get '/profile/:id/edit' do
  @user = User.find(session[:user_id])
  if @user
    erb :"profile/edit"
  else
    status 404
    "Profile Not Found"
  end
end

#update
put '/profile/:id/' do
@user = User.find(session[:user_id])
@user.title = params[:title]
@user.description = params[:description]
@user.price = params[:price]
@user.author_id = params[:author_id]
if @user.save
  redirect "/categories/#{@user.category_id}/articles/#{@user.id}"
else
  status 401
  erb :"articles/edit"
end
end

#delete
delete '/profile/:id' do
@user = User.find(params[:id])
  if @user
    @user.destroy
  else
    status 404
    "User not found"
  end
  redirect "/"
end
