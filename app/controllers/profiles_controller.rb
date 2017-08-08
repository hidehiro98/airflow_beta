class ProfilesController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
    authorize @user
  end

  def edit
  end

  def update
    authorize @user
    if @user.update(user_params)
      redirect_to profile_path
    else
      render :edit
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :photo)
  end
end
