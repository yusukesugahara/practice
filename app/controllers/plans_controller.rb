class PlansController < ApplicationController
  before_action :authenticate_user!
  before_action :plans_set, only: [:index,:show,:destroy]

  def index
  end

  def new
    @plan = Plan.new
  end

  def create
    Plan.create(plan_params)
    redirect_to plans_path

  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    plan = Plan.find(params[:id])
    if plan.id == current_user.id
      plan.update(plan_params)
    end
  end

  def destroy
    plan = Plan.find(params[:id])
    if current_user.id == plan.user_id
      plan.delete
    end
    redirect_to plans_path
  end

  def show
    @plan = Plan.find(params[:id])
    @diaries = @plan.diaries.order(created_at: :desc)
    @comment = Comment.new
  end

  private
  def plans_set
    @plans = Plan.where(user_id: current_user.id)
  end

  def plan_params
    params.require(:plan).permit(:name,:date,:text).merge(user_id: current_user.id)
  end

end
