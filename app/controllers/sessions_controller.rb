class SessionsController < ApplicationController

  def new
  end

  def create
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:user_id] = user.id.to_s
      redirect_to root_path
    else
    # If user's login doesn't work, send them back to the login form.
      # redirect_to '/login'
      flash.now.alert = "Incorrect email or password, try again."
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end

end
