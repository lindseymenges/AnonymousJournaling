class EntriesController < ApplicationController
  def index
    @entries = Entry.where(user_id: session[:user_id])
  end

  def new
    @entry = Entry.new
  end

  def create
    @user = User.find(session[:user_id])
    @entry = Entry.new(params[:entry])
    @entry.author = @user.public_username
    @entry.user_id = @user.id
    if @entry.save
      redirect_to root_path
    else
      render :new
    end
  end
end