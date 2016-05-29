enable :sessions

get "/login" do
  erb :"sessions/login"
end

post "/login" do
  @user = User.find_by(username: params[:username])
  if @user && @user.authenticate(params[:password])
    session[:id] = @user.id
    @decks = Deck.all
    erb :"decks/index" 
  else
    @errors = ["Your email or password is invalid"]
    erb :"sessions/login"
  end
end

get '/logout' do
  session.clear
  redirect '/'
end