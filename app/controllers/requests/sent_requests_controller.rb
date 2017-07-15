class Requests::SentRequestsController < ApplicationController
  def index
    @requests = policy_scope(Request).open.order(:duedate)
  end

  def closed
    @requests = policy_scope(Request).closed.order(:duedate)
  end
end
