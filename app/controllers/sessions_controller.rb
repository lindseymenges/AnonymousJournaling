class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_username(params[:username])
    if @user == nil
      redirect_to root_path
    else
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to root_path
      else
        redirect_to root_path
      end
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end