class ApplicationController < ActionController::Base
  protect_from_forgery
  def index
    @user_entries = Entry.where(user_id: session[:user_id]).order('created_at DESC')
    @entries = Entry.order('created_at DESC').paginate(:page => params[:page], :per_page => 5)
  end
end
