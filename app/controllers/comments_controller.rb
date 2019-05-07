class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    comment = Comment.new(comment_params)
    if current_user.id == comment.user_id
      Comment.create(comment_params)
    end
    redirect_to diaries_path
  end
  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id,diary_id: params[:diary_id])
  end

end
