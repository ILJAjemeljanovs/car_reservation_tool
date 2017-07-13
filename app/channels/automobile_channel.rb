class AutomobileChannel < ApplicationCable::Channel
  def subscribed
    stream_from "garage"
  end

  def unsubscribed
  end

  def reserve
  end
end
