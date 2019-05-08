class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comment.new(comment_params)
    if current_user.id == @comment.user_id
      if @comment.save
        respond_to do |format|
          format.html {redirect_to diaries_path}
          format.json
        end
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.user_id == current_user.id
      @comment.destroy
      respond_to do |format|
        format.html {redirect_to diaries_path}
        format.json
      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id,diary_id: params[:diary_id])
  end

end
