class UsersController < ApplicationController
  def create_public_username
    full_public_username = Faker::Commerce.product_name + " " + Random.rand(999).to_s
    if User.find_by_public_username(full_public_username) == nil
      return full_public_username
    else
      create_public_username
    end
  end

  def index
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.public_username = create_public_username
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @user = User.find(session[:user_id])
    posts = Entry.find_by_user_id(@user.id)
    if @user.authenticate(params[:password])
      posts.destroy
      @user.destroy
      session.clear
      redirect_to root_path
    else
      render :login_error
    end
  end
end