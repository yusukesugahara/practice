class DiariesController < ApplicationController
  before_action :authenticate_user!
  before_action :diaries_set
  before_action :diary_set, only: [:update,:destoy]

  def index
    @diaries = Diary.where(user_id: current_user.id)
  end

  def new
    @diary = Diary.new(plan_id: params[:plan_id], square_id: params[:square_id])
    @plan = Plan.find(params[:plan_id])
  end

  def create
    binding.pry
    diary = Diary.new(diary_params)
    if diary.user_id == current_user.id
      Diary.crate(diary_params)
    end
    redirect_to plans_path
  end

  def edit

  end

  def update
    diary.create
  end

  def destory
    diary.destory
  end

  def show
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
