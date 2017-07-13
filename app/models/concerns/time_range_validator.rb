class TimeRangeValidator < ActiveModel::Validator
  #validates start < end
  #validates if time intersects with existing
  #validates if time goes out of range of start day
  def validate(record)
    if record.start_date.blank? 
      record.errors.add(:start_date, "can't be blank")
    elsif record.end_date.blank?
      record.errors.add(:end_date, "can't be blank")
    else
      if record.start_date > record.end_date
        record.errors.add(:start_date, "can't be greater than end time")
      end
      if conflicting_records_count(record) > 0
        record.errors.add(:time_range, "is conflicting with existing reservations")
      end
      if record.start_date.end_of_day < record.end_date
        record.errors.add(:time_range, "can't cover multiple days")
      end
    end
  end

  def conflicting_records_count record, result=0
    result += Reservation.where("car_id = ? AND start_date >= ? AND end_date <= ? ", record.car_id, record.start_date, record.end_date).count
    result += Reservation.where("car_id = ? AND start_date <= ? AND end_date >= ? ", record.car_id, record.start_date, record.start_date).count
    result += Reservation.where("car_id = ? AND start_date <= ? AND end_date >= ? ", record.car_id, record.end_date, record.end_date).count
    result
  end
end
