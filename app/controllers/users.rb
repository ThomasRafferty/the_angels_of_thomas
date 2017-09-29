get '/' do
  erb :'index'
end

get '/users/login' do
  erb :'/users/login'
end

post '/users/login' do

  @user = User.find_by(email: params[:user][:email])

  if @user.authenticate(params[:user][:password])
    session[:id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    erb :'/users/login'
  end
end


get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  @new_user = User.new(params[:user])
  if @new_user.save
    redirect '/'
  else
    @errors = @new_user.errors.full_messages
    erb :'users/new'
  end
end

get 'users/:id' do
  @user = user.find_by(id: params[:id])
  if current_user == @user
    erb :'user/show'
  else
    erb :'users/login'
  end
end

post '/logout' do
  session.clear
  redirect '/'
end
