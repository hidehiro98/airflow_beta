class Requests::ReceivedRequestsController < ApplicationController
  def index
    receivers = policy_scope(Receiver).pending
    @requests = Request.where(id: receivers.pluck(:request_id))
    # @requests = policy_scope(Receiver).pending.map(&:request).sort_by(&:duedate)
  end

  def replied
    receivers = policy_scope(Receiver).replied
    @requests = Request.where(id: receivers.pluck(:request_id))
    # @requests = policy_scope(Receiver).replied.map(&:request).sort_by(&:duedate)
  end
end
