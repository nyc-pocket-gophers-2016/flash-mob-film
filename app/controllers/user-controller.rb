
# Make a new account
get "/users/new" do
  erb :"users/new"
end

# Make a new account - post method for submit
post "/users" do
  @user = User.new(username: params[:username], password: params[:password])
  if @user.save
    redirect "/users/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    erb :'users/new'
  end
end

# Edit a user account
get "/users/:id/edit" do
  @user = User.find_by(id: params[:id])
  erb :"users/edit"
end

put "/users/:id" do
  @user = User.find_by(id: params[:id])
  @user.assign_attributes(username: params[:username], password: params[:password])
  if @user.save
    redirect "/users/#{@user.id}"
  else 
    erb :"users/edit"
  end
end

# Show the user profile page
get "/users/:id" do
  @user = User.find_by(id: params[:id])
  erb :"users/show"
end 

# Delete a user
delete "/users/:id" do
  @user = User.find_by(id: params[:id])
  @user.destroy
  redirect "/"
end

