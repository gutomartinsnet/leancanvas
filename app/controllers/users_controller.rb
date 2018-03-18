class UsersController < ApplicationController
  def show
    if request.path == "/"
      @user = current_user
    else
      @user = User.find_by(id: params[:id])
    end
    @plans = @user.plans.all if @user.plans != nil

  end
end
