class UsersController < ApplicationController

  def show
    if current_user.id == params[:id].to_i
      @user = User.find(params[:id])
    else
      render file: "/public/404"
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_links_path(@user)
    else
      flash[:error] = "Invalid input - Please try creating user again"
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:email,:password,:password_confirmation)
  end

end
