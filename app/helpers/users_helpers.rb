helpers do

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    User.find(session[:user_id]) if logged_in?
  end

  # probably not named correctly
  def authorize
    if !logged_in
      redirect '/login/index'
    end
  end

end
