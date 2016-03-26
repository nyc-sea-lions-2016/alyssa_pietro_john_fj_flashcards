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

get '/users/:id' do
  @user = User.find_by(id: params[:id])
  @games = @user.games.all
  erb :'users/show'
end

get 'users/:id/edit' do
  @user = User.find(params[:id])
  erb :'users/edit'
end
