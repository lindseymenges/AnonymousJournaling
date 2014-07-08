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
  end
end