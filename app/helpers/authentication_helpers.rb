helpers do

  def current_user
    User.find_by(id: session[:current_user_id])
  end

  def logged_in?
    !!(current_user)
  end

end