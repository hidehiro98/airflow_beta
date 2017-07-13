class CommentsController < ApplicationController
  def create
    @request = Request.find(params[:request_id])
    @comment = Comment.new(comment_params)
    @comment.request = @request
    @comment.author = current_user
    authorize @comment
    if @comment.save
      redirect_to request_path(@request)
    else
      flash[:alert] = "Information missing."
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
