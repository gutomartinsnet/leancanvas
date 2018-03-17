class PlansController < ApplicationController
  before_action :set_plan,only: [:show,:edit,:update,:destroy]

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  private
  def set_plan
    @plan = Plan.find(params[:id])
  end

  def plan_params
    params.require(:plan).permit(:title,:segment,:problem,:valu,:solution,:chanel,:profit,:cost,:parameter,:superiority)
  end
end
