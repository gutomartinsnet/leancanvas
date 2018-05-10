class PlansController < ApplicationController
  before_action :set_plan,only: [:show,:edit,:update,:destroy,:imgsave]

  def index
    @plans = Plan.where(desplay: true).order("created_at DESC")
  end

  def show
  end

  def new
    @plan = Plan.new()
  end

  def edit
  end

  def create
    @plan = current_user.plans.new(plan_params)
    if @plan.save
      redirect_to users_show_path(current_user.username), notice: 'LeanCanvasを作成しました'
    else
      render :new
    end
  end

  def update
    if @plan.update(plan_params)
      kit   = IMGKit.new(request.url)
      img   = kit.to_img(:png)
      file  = Tempfile.new(["image_#{@plan.id}", '.png'], 'tmp',:encoding => 'ascii-8bit')
      file.write(img)
      file.flush
      @plan.image = file
      @plan.update(plan_params)
      redirect_to @plan, notice: '更新しました'
    else
      render :edit
    end
  end

  def destroy
    @plan.destroy!
    redirect_to root_path, notice: '削除しました'
  end

  def imgsave
    kit   = IMGKit.new(request.referer)
    img   = kit.to_img(:png)
    file  = Tempfile.new(["image_#{@plan.id}", '.png'], 'tmp',:encoding => 'ascii-8bit')
    file.write(img)
    file.flush
    @plan.image = file
    @plan.update(plan_params)
  end

  private
  def set_plan
    @plan = Plan.find(params[:id])
  end

  def plan_params
    params.require(:plan).permit(:id,:title,:segment,:problem,:valu,:solution,:chanel,:profit,:cost,:parameter,:superiority,:image, :desplay)
  end
end
