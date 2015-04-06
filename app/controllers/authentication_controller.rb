class AuthenticationController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = 'Welcome'
      redirect_to babies_path
    else
      render :new
    end
  end

  def destroy
    session.clear
    flash[:notice] = 'Goodbye'
    redirect_to babies_path
  end
end
