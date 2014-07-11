class EntriesController < ApplicationController
  def index
    @user_entries = Entry.where(user_id: session[:user_id]).order('created_at DESC')
    @entries = Entry.order('created_at DESC').paginate(:page => params[:page], :per_page => 5)
  end

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
      render :new
    end
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy
    render :delete
  end
end