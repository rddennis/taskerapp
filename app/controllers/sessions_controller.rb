class SessionsController < ApplicationController

  def new
  end

  #Sign in
  def create
    auth = request.env['omniauth.auth']

    # Go look in our db for a user with that provider and uid. If they don't exist yet, create them.
    user = User.find_by(provider: auth['provider'], uid: auth['uid']) || User.create_with_omniauth(auth)

    # once we have the user, set the session[:user_id]
    session[:user_id] = user.id

    redirect_to root_url, notice: "Welcome, #{user.name}!"
  end

  #Sign out
  def destroy
    session[:user_id] = nil
    redirect_to signin_url, notice: "All signed out. Goodbye!"
  end
end