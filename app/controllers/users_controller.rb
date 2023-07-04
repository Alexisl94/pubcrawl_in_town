class UsersController < ApplicationController
  before_action :authenticate_user!

  def profile
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to root_path, notice: "Updated !"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:avatar, :nickname, :description)
  end
end
