class PlansController < ApplicationController
  before_action :set_plan,only: [:show,:edit,:update,:destroy]

  def index
    @plans = Plan.order("created_at DESC")
  end

  def show
  end

  def new
    @plan = current_user.plans.new()
  end

  def edit
  end

  def create
    @plan = current_user.plans.new(plan_params)
    if @plan.save
      redirect_to @plan, notice: 'LeanCanvasを作成しました'
    else
      render :new
    end
  end

  def update
    if @plan.update(plan_params)
      redirect_to @plan, notice: '更新しました'
    else
      render :edit
    end
  end

  def destroy
    @plan.destroy!
    redirect_to root_path, notice: '削除しました'
  end

  private
  def set_plan
    @plan = Plan.find(params[:id])
  end

  def plan_params
    params.require(:plan).permit(:title,:segment,:problem,:valu,:solution,:chanel,:profit,:cost,:parameter,:superiority)
  end
end