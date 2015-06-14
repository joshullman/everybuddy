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
  @tag.save
  @user_tag = UserTag.new(user_id: current_user.id, tag_id: @tag.id)
  if @user_tag.save
    @tags = current_user.tags
    erb :"tags/new"
  else
    status 400
    erb :"tags/new"
  end
end

#show
# get '/users/:user_id/tags/:tag_id' do
#   @tag = Tag.find_by(id: params[:tag_id])
#   p "*" * 90
#   p @tag
#   p "*" * 90
#   if @tag
#     @users = []
#     User.all.each do |user|
#      user.tags.each do |tag|
#        @users << user if tag.id == params[:tag_id]
#      end
#     end
#     p "*" * 90
#     p @users
#     p "*" * 90
#     erb :"tags/show"
#   else
#     status 404
#     redirect "/users/#{current_user.id}"
#   end
# end

# #edit
# get '/users/:user_id/tags/:tag_id/edit' do
#   @tag = User.find(session[:tag_id])
#   if @tag
#     erb :"tags/edit"
#   else
#     status 404
#     "Tag Not Found"
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

#delete
delete '/users/:user_id/tags/:tag_id' do
@user_tag = UserTag.where(user_id: current_user.id, tag_id: params[:tag_id]).first
  if @user_tag
    @user_tag.destroy
  else
    status 404
    "Tag not found"
  end
  redirect "/users/:user_id/tags"
end
