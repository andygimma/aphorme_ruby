class SessionsController < ApplicationController
  def new
  end

  def create
    #awaiting omniauth
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed out"
  end

  def failure
#     redirect_to new_session_path, notice: "Authentication failed"
  end

  def forgot_password
  end
  
  def create_without_omniauth
    email = params[:email]
    password = params[:password]
    @user = User.where("email = ? AND password = ?", email, password).first
    if @user.blank?
      user = User.new :password => password, :email => email
      user.save
      session[:user_email] = user.email  
      session[:user_id] = user.id
      redirect_to '/'
    else
      session[:user_email] = @user.email  
      session[:user_id] = @user.id
      redirect_to '/about'
    end
  end
  
  def logout
      session[:user_email] = nil
      redirect_to '/'
  end
end
