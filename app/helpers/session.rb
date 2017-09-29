def current_user
  @current_user ||= User.find_by(id: session[:id])
end

def logged_in?
  !!current_user
end

def require_user
  redirect '/users/login' unless logged_in?
end
