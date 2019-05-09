class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
    group = Group.create(group_new_params)
    UserGroup.create(group_id: group.id,user_id: current_user.id)
    redirect_to action: 'show',id: group.id
  end

  def edit
    @group = Group.find(params[:id])
    @users = User.where(invited_by_id: current_user.id)
  end

  def update
    group = Group.find(params[:id])
    unless group.users.where(user_id: current_user.id).nil?
      group.update(group_params)
    end
    redirect_to action: 'show',id: group.id
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
