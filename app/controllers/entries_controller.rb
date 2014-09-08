class EntriesController < ApplicationController
  def show
    @entry = Entry.find(params[:id])
    render :show
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
      render :new_with_error_message
    end
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy
    render :delete
  end
end