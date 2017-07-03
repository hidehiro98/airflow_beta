class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy, :cancel, :delete]

  def show
    @comment = Comment.new
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    @request.user = current_user

    if @request.save
      redirect_to request_path(@request)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def cancel
    @request.canceled!
    redirect_back(fallback_location: root_path)
  end

  def delete
    @request.deleted!
    @request.delete_receivers
    redirect_back(fallback_location: root_path)
  end

  private

  def set_request
    @request = Request.find(params[:id])
  end

  def request_params
    params.require(:request).permit(:content, :duedate, user_ids: [])
  end
end
