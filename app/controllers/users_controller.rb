class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    if User.exists?(params[:id])
      @user = User.find(params[:id])
      redirect_to controller: 'users', action: 'profile', username: @user.username
    else
      redirect_to controller: 'pages', action: 'invalid'
    end
  end

  def profile
    if User.find_by username: params[:username]
      @user = User.find_by_username(params[:username])
      @thoughts = @user.thoughts.paginate(:page => params[:page], :per_page => 10)
    else
      redirect_to controller: 'pages', action: 'invalid'
    end
  end

  def edit
    @user = User.find(params[:id])
    # Only allows you to edit your own profile
    if current_user != @user
      redirect_to root_path
    end
  end

  def update
     @user = User.find(params[:id])

     if @user.update(user_params)
       redirect_to root_path
     else
       render 'edit'
     end
  end

  private
  def user_params
    params.require(:user).permit(:name, :username, :email, :password)
  end
end
