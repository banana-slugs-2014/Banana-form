helpers do
  def logged_in?
    !!session[:user_id]
  end

  def current_user
    if logged_in?
      User.find(session[:user_id])
    else
      false
    end
  end

  def current_user_surveys
    if logged_in?
      current_user.surveys
    else
      []
    end
  end

  def logout
    session.clear
  end
end