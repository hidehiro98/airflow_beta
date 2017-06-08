class Requests::ReceivedRequestsController < ApplicationController
  def index
    receivers = Receiver.where(user: current_user)
    @requests = []
    receivers.each { |receiver| @requests << receiver.request }
    @requests
  end
end
