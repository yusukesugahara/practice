class DiariesController < ApplicationController
  before_action :authenticate_user!
  before_action :diaries_set
  before_action :diary_set, only: [:update,:destoy]

  def index
    @diaries = Diary.where(user_id: current_user.id).order(created_at: :desc)
    @comment = Comment.new
  end

  def new
    @diary = Diary.new(plan_id: params[:plan_id], square_id: params[:square_id])
    @plan = Plan.find(params[:plan_id])
  end

  def create
    diary = Diary.new(diary_params)
    if diary.user_id == current_user.id
      Diary.create(diary_params)
    end
    redirect_to plans_path
  end

  def edit

  end

  def update
    diary.create
  end

  def destroy
    diary = Diary.find(params[:id])
    if diary.user_id == current_user.id
      diary.destroy
    end
    redirect_to action: :index
  end

  def show
    @diary.find(params[:id])
  end

  private
  def diaries_set
    @diaries = Diary.where(user_id: current_user.id)
  end

  def diary_set
    diary = Diary.find(params[:id])
  end

  def diary_params
    params.require(:diary).permit(:name,:date,:text,:square_id).merge(user_id: current_user.id,plan_id: params[:plan_id])
  end

end
