class ReceiversController < ApplicationController
  def accept
    current_user.receivers.find_by(request_id: params[:id]).accepted!
    redirect_back(fallback_location: root_path)
  end

  def reject
  end
end
