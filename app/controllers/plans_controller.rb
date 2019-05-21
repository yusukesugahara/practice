class PlansController < ApplicationController
  before_action :authenticate_user!
  before_action :plans_set

  def index
  end

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)
    @group = Group.find(params[:group_id])
    if @plan.save
      redirect_to group_plans_path(@plan.group), notice:'予定が作成されました。'
    else
      flash.now[:alert] = '予定の作成に失敗しました。'
      render :new
    end
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    @plan = Plan.find(params[:id])
    if @plan.update(plan_params)
      redirect_to group_plans_path(@group), notice:'予定が更新されました。'
    else
      flash.now[:alert] = '予定の更新に失敗しました。'
      render :edit
    end
  end

  def destroy
    plan = Plan.find(params[:id])
    if current_user.groups.first.id == plan.group.id
      plan.delete
      redirect_to group_plans_path(@group), notice:'予定が削除されました。'
    else
      flash.now[:alert] = '予定の削除に失敗しました。'
      render :back
    end

  end

  def show
    @plan = Plan.find(params[:id])
    @diaries = @plan.diaries.order(created_at: :desc)
    @comment = Comment.new
  end

  private
  def plans_set
    @plans = Plan.where(group_id: params[:group_id]).page(params[:page]).per(14).order("created_at DESC")
    @group = Group.find(params[:group_id])
  end

  def plan_params
    params.require(:plan).permit(:name,:date,:text,:group_id).merge(group_id: params[:group_id])
  end
end
