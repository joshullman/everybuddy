#index
get "/tags" do
  @tags = current_user.tags
  erb :"tags/index"
end

#new
get "/tags/new" do
  @tags = current_user.tags
  @tag = Tag.new
  @user_tag = UserTag.new(user_id: current_user.id)
  erb :"tags/new"
end

#create
post "/tags" do
  tag = Tag.find_by(name: params[:name]) || tag = Tag.new(name: params[:name])
  tag.save
  event_tag = EventTag.new(event_id: event.id, tag_id: tag.id)
  if event_tag.save
    tags = event.tags
    erb :"tags/_new", locals: {tag: tag}, layout: false
  else
    status 400
    # erb :"tags/new"
  end
end

#delete
delete "/tags/:tag_id" do
  user_tag = UserTag.where(user_id: current_user.id, tag_id: params[:tag_id]).first
  if user_tag
    user_tag.destroy
  else
    status 404
    "Tag not found"
  end
  redirect "/tags"
end
