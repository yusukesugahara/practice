class DiariesController < ApplicationController
  before_action :authenticate_user!
  before_action :diary_set, only: [:update,:destoy]
  before_action :diaries_set

  def index
    @diaries = Diary.where(user_id: current_user.id).page(params[:page]).per(14).order("created_at DESC")
    @comment = Comment.new
  end

  def new
    @diary = Diary.new(plan_id: params[:plan_id], square_id: params[:square_id])
    @plan = Plan.find(params[:plan_id])
  end

  def create
    @diary = Diary.new(diary_params)
    if @diary.save
      redirect_to group_plan_path(current_user.groups.first,@diary.plan)
    else
      render :new
    end
  end

  def edit
    @diary = Diary.find(params[:id])
    @plan = Plan.find(@diary.plan)
  end

  def update
    @diary = Diary.find(params[:id])
    @plan = @diary.plan
    if @diary.update(diary_edit_params)
      redirect_to group_plan_path(current_user.groups.first,@diary.plan)
    else
      render :edit
    end
  end

  def destroy
    diary = Diary.find(params[:id])
    if diary.user_id == current_user.id
      diary.destroy
    end
    redirect_to action: :index
  end

  private
  def diaries_set
    @diaries = Diary.where(user_id: current_user.id)
  end

  def diary_set
    @diary = Diary.find(params[:id])
  end

  def diary_params
    params.require(:diary).permit(:name,:date,:text,:square_id).merge(user_id: current_user.id,plan_id: params[:plan_id])
  end

  def diary_edit_params
    params.require(:diary).permit(:name,:date,:text,:square_id)
  end

end
