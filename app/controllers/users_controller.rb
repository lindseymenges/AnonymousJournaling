class UsersController < ApplicationController
  def create_public_username
    full_public_username = Faker::Address.city + " " + Random.rand(999).to_s
    if User.find_by_public_username(full_public_username) == nil
      return full_public_username
    else
      create_public_username
    end
  end

  def show
    @user = User.find(params[:id])
    @entries = Entry.where(user_id: @user.id)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.public_username = create_public_username
    if User.find_by_username(@user.username) == nil
      if @user.save
        session[:user_id] = @user.id
        redirect_to root_path
      else
        render :new_with_field_error
      end
    else
      render :new_with_error
    end
  end

  def destroy
    @user = User.find(session[:user_id])
    puts @user
    posts = Entry.find_by_user_id(@user.id)
    if posts != nil
      Entry.destroy(posts)
    end
    User.destroy(@user)
    session.clear
    redirect_to root_path
  end
end