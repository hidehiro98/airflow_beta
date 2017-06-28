class Requests::SentRequestsController < ApplicationController
  def index
    @requests = current_user.requests.open.order(:duedate)
  end

  def closed
    @requests = current_user.requests.closed.order(:duedate)
  end
end
