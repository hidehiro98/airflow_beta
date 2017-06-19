class Requests::ReceivedRequestsController < ApplicationController
  def index
    @requests = current_user.received_requests.sort_by { |request| request.duedate }
  end
end
