class ItemCommentsController < ApplicationController
  def create
    ItemComment.create(comment_params)
    redirect_to item_path(params[:item_id])
  end

  private
  def comment_params
    params.require(:item_comment).permit(:comment).merge(item_id:params[:item_id],user_id:current_user.id)
  end
end
