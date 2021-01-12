class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User created."
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @organized_events = @user.organized_events
    redirect_to root_url and return unless @user == current_user
  end

  private

    def user_params
      params.require(:user).permit(:username, :email)
    end
end
