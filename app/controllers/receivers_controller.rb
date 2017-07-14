class ReceiversController < ApplicationController
  def accept
    @receiver = current_user.receivers.find_by(request_id: params[:id])
    authorize @receiver
    @receiver.accepted!
    Request.find(params[:id]).check_status
    redirect_back(fallback_location: root_path)
  end

  def reject
    @receiver = current_user.receivers.find_by(request_id: params[:id])
    authorize @receiver
    @receiver.rejected!
    Request.find(params[:id]).check_status
    redirect_back(fallback_location: root_path)
  end
end
