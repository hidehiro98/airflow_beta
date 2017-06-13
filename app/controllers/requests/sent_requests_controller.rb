class Requests::SentRequestsController < ApplicationController
  def index
    @requests = current_user.requests
  end
end
