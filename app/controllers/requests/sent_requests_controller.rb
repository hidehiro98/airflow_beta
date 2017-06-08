class Requests::SentRequestsController < ApplicationController
  def index
    @requests = Request.where(user: current_user)
  end
end
