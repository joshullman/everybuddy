#index
get '/users/:user_id/tags' do
  @tags = current_user.tags
  erb :"tags/index"
end

#new
get '/users/:user_id/tags/new' do
  @tags = current_user.tags
  @tag = Tag.new
  @user_tag = UserTag.new(user_id: current_user.id)
  erb :"tags/new"
end

#create
post '/users/:user_id/tags' do
  @tag = Tag.find_by(name: params[:tag]) || @tag = Tag.new(name: params[:tag])
  @user_tag = UserTag.new(user_id: current_user.id, tag_id: @tag.id)
  if @tag.save && @user_tag.save
    @tags = current_user.tags
    erb :"tags/new"
  else
    status 400
    erb :"tags/new"
  end
end

# #show
# get '/users/:user_id/tags' do
#   @user = User.find_by(id: params[:id])
#   if @user
#     erb :"tags/show"
#   else
#     status 404
#     redirect '/'
#   end
# end

# #edit
# get '/users/:user_id/tags/:tag_id/edit' do
#   @user = User.find(session[:user_id])
#   if @user
#     erb :"tags/edit"
#   else
#     status 404
#     "User Not Found"
#   end
# end

# #update
# put '/users/:user_id/tags/:tag_id' do
# @user = User.find(session[:user_id])
# @user.title = params[:title]
# @user.description = params[:description]
# @user.price = params[:price]
# @user.author_id = params[:author_id]
#   if @user.save
#     redirect "/categories/#{@user.category_id}/articles/#{@user.id}"
#   else
#     status 401
#     erb :"tags/edit"
#   end
# end

# #delete
# delete '/users/:user_id/tags/:tag_id' do
# @user = User.find(params[:id])
#   if @user
#     @user.destroy
#   else
#     status 404
#     "User not found"
#   end
#   redirect "/"
# end
