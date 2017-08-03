class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy, :cancel]

  def show
    authorize @request
    @comment = Comment.new
  end

  def new
    @request = Request.new
    authorize @request
  end

  def create
    @request = Request.new(request_params)
    @request.user = current_user
    authorize @request

    if @request.save
      RequestMailer.created(@request).deliver_now
      @request.receivers.each do |receiver|
        ReceiverMailer.received(receiver).deliver_now
      end
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
    authorize @request
    RequestMailer.destroyed(@request).deliver_now
    @request.destroy
    redirect_to requests_sent_path
  end

  def cancel
    authorize @request
    RequestMailer.canceled(@request).deliver_now
    @request.canceled!
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
