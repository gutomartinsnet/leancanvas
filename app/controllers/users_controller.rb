class UsersController < ApplicationController
  def show
    if request.path == "/"
      @user = current_user
    else
      @user = User.find_by(username: params[:username])
    end

    if user_signed_in?
      if current_user.username == @user.username
        @plans = @user.plans.order("updated_at DESC") if @user.plans != nil
      else
        @plans = @user.plans.where(desplay: true).order("updated_at DESC") if @user.plans != nil
      end
    else
      @plans = @user.plans.all.order("updated_at DESC") if @user.plans != nil
    end
  end
end
