class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit,:update,:index,:destroy,:followers, :following]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "welcome to my app"
      sign_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Update Success"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_path
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'showUsers'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'showUsers'
  end

  private 

    def user_params
      params.require(:user).permit(:name,:email,:password,:password_confirmation)
    end

    def admin_user 
      redirect_to root_path unless current_user.admin?
    end

    def correct_user 
      @user = User.find(params[:id])
      redirect_to root_path, notice: "no no no" unless current_user?(@user)
    end
end
