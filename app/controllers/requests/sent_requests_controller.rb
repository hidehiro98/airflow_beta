class Requests::SentRequestsController < ApplicationController
  def index
    @requests = current_user.requests.order(:duedate)
  end
end
