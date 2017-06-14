class ReceiversController < ApplicationController
  def accept
    current_user.receivers.find_by(request_id: params[:id]).accepted!
    Request.find(params[:id]).check_status
    redirect_back(fallback_location: root_path)
  end

  def reject
    current_user.receivers.find_by(request_id: params[:id]).rejected!
    redirect_back(fallback_location: root_path)
  end
end
