def current_user
  User.find_by(id: session[:id])
end

def logged_in?
  session[:id] && current_user.present?
end

def redirect_unless_logged_in
  redirect '/' if !logged_in
end

def redirect_unless_I_am(user)
  redirect '/' unless current_user == user
end
