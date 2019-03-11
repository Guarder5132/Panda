class UsersController < ApplicationController
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

  def show
    @user = User.find(params[:id])
  end

  private 

    def user_params
      params.require(:user).permit(:name,:email,:password,:password_confirmation)
    end
end
