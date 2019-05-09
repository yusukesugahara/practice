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
      redirect_to group_plans_path(@plan.group)
    else
      render :new
    end
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    @plan = Plan.find(params[:id])
    if @plan.update(plan_params)
      redirect_to group_plans_path(@group)
    else
      render :edit
    end
  end

  def destroy
    plan = Plan.find(params[:id])
    if current_user.groups.first.id == plan.group.id
      plan.delete
    else
      render :back
    end
    redirect_to group_plans_path(@group)
  end

  def show
    @plan = Plan.find(params[:id])
    @diaries = @plan.diaries.order(created_at: :desc)
    @comment = Comment.new
  end

  private
  def plans_set
    @plans = Plan.where(group_id: current_user.group_ids).page(params[:page]).per(14).order("created_at DESC")
    @group = Group.find(current_user.groups.first)
  end

  def plan_params
    params.require(:plan).permit(:name,:date,:text,:group_id).merge(group_id: params[:group_id])
  end
end
