class Reservation < ApplicationRecord
  belongs_to :car
  belongs_to :user

  validates_with TimeRangeValidator

end
