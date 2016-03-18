get '/users/new' do
  erb :'users/new'
end

post '/users' do
  user = User.new(params)

  if user.save
    session[:user_id] = user.id
    redirect '/users'
  else
    @errors = user.errors.full_messages
    erb :'/users/new'
  end
end

get '/users' do
  @user = User.find(current_user.id)

  erb :'/users/show'
end
