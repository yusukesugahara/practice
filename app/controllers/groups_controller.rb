class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
    group = Group.create(group_params)
    redirect_to action: 'show',id: group.id
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    Group.update(group_params)
  end

  def show
    @group = Group.find(params[:id])
  end

  private
  def group_params
    params.require(:group).permit(:name,:user_ids)
  end
end
