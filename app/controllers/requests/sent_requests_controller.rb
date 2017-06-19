class Requests::SentRequestsController < ApplicationController
  def index
    @requests = current_user.requests.sort_by { |request| request.duedate }
  end
end
