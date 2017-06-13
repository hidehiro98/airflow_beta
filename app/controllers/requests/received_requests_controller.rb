class Requests::ReceivedRequestsController < ApplicationController
  def index
    @requests = current_user.received_requests
  end
end
