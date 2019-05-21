class GroupsController < ApplicationController
  before_action :authenticate_user!

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_new_params)
    if @group.save
      UserGroup.create(group_id: @group.id,user_id: current_user.id)
      redirect_to action: 'show',id: @group.id, notice:'グループが作成されました。'
    else
      flash.now[:alert] = 'グループの作成に失敗しました。'
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
    @users = User.where(invited_by_id: current_user.id)
  end

  def update
    @group = Group.find(params[:id])
    unless @group.users.where(user_id: current_user.id).nil?
      if @group.update(group_params)
        redirect_to action: 'show',id: @group.id, notice:'グループが更新されました。'
      else
        flash.now[:alert] = 'グループの更新に失敗しました。'
        render :edit
      end
    else
      flash.now[:alert] = 'グループを作成してください。'
      render :edit
    end

  end

  def show
    @group = Group.find(params[:id])
  end

  private
  def group_new_params
    params.require(:group).permit(:name)
  end
  def group_params
    params.require(:group).permit(:name,user_groups_attributes:[:id,:user_id,:_destroy])
  end
end
