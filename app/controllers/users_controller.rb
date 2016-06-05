class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create], raise: false

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = sign_up(user_params)

    if @user.valid?
      sign_in(@user)
      if params[:mentor]
        @mentor = Mentor.new
        @mentor.user_id = @user.id
        @mentor.save
        redirect_to user_path(@user)
      end
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user = current_user
      @user.update(user_params)
      flash[:notice] = "Updated Successfully"
      redirect_to user_path(@user)
    else
      redirect_to :back
      flash[:notice] = "Sorry something went wrong"
    end
  end

  private

  def user_params
    params.require(:user).permit(:admin, :username, :first_name, :last_name, :bio, :email, :password)
  end
end
