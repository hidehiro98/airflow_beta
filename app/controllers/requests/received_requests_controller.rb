class Requests::ReceivedRequestsController < ApplicationController
  def index
    @requests = policy_scope(Receiver).pending.map(&:request).sort_by(&:duedate)
  end

  def replied
    @requests = policy_scope(Receiver).replied.map(&:request).sort_by(&:duedate)
  end
end
