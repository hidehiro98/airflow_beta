class Requests::ReceivedRequestsController < ApplicationController
  def index
    @requests = current_user.receivers.pending.map(&:request).sort_by(&:duedate)
  end

  def replied
    @requests = current_user.receivers.replied.map(&:request).sort_by(&:duedate)
  end
end
