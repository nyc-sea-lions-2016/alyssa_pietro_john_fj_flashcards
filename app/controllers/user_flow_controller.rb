# Login
get '/sessions/new' do
 erb :"sessions/new"
end


post '/sessions/new' do
  found_user = User.find_by(username: params[:user][:username])
  if found_user && found_user.authenticate(params[:user][:password])
    session[:user_session_id] = found_user.id
    redirect '/'
  else
    @errors = ["Incorrect username or password"]
    erb :"sessions/new"
  end
end


#Create user
get '/users/new' do
  erb :"users/new"
end

post '/users/new' do
  @new_user = User.new(params[:user])
  if @new_user.save
    session[:user_session_id] = @new_user.id
    redirect '/'
  else
    @errors = @new_user.errors.full_messages
    erb :"users/new"
  end
end

get '/logout' do
  session.clear
  redirect '/'
end
