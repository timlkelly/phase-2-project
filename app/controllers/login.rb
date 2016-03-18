get '/login' do
  erb :'/login/index'
end 

post '/login' do
  user = User.find_by(email: params[:email])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect '/'
  else
    @errors = ["Incorrect Email/Password"]
    erb :'/login/index'
  end
end

get '/logout' do
  session.delete(:user_id)
  redirect '/'
end
