class Requests::ReceivedRequestsController < ApplicationController
  def index
    @requests = current_user.received_requests.pending.order(:duedate)
  end

  def replied
    @requests = current_user.received_requests.closed.order(:duedate)
  end
end
