class SessionsController < ApplicationController

  def new
  end

  def create
    p params
    user = User.find_by_email params[:session][:email]

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      render plain: "Logged in"
      # redirect_to companies_path
    else
      render plain: "Login Not Successful"
    end
  end

  def destroy
    session[:user_id] = nil
    render plain: "Logged out!"
  end

end
