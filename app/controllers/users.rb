#new
get '/users/new' do
  erb :"users/new"
end

#create
post '/users' do
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
get '/users/:id' do
  p "Am i getting here?"
  @user = User.find_by(id: params[:id])
  p '*' * 90
  p @user
  p '*' * 90
  if @user
    erb :"users/show"
  else
    status 404
    redirect '/'
  end
end

#edit
get '/users/:id/edit' do
  @user = User.find(session[:user_id])
  if @user
    erb :"users/edit"
  else
    status 404
    "User Not Found"
  end
end

#update
put '/users/:id' do
  puts "Why the hell am I here?"
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
delete '/users/:id' do
  p "Am I here??"
@user = User.find(params[:id])
  if @user
    @user.destroy
  else
    status 404
    "User not found"
  end
  redirect "/"
end


