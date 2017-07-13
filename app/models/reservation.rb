class Reservation < ApplicationRecord
  belongs_to :car
  belongs_to :user

  validates_with TimeRangeValidator

  after_create_commit :broadcast_create_changes
  after_destroy_commit :broadcast_destroy_changes


  def broadcast_create_changes
    ActionCable.server.broadcast "garage", date: self.start_date.to_date.to_s, user_id: self.user_id, car_id: self.car_id, time_period: self.time_period_html, reservation_id: self.id, action: 'create'
  end

  def broadcast_destroy_changes
    ActionCable.server.broadcast "garage", reservation_id: self.id, action: 'delete'
  end

  def time_period
    "#{self.start_date.strftime("%H:%M")} - #{self.end_date.strftime("%H:%M")}"
  end

  def time_period_html
    "<p id= 'reservation_#{self.id}'>  #{self.time_period} </p>"
  end
end
