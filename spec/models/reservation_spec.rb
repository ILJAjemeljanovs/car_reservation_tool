require 'rails_helper'

RSpec.describe Reservation, type: :model do
  let(:action_cable) { ActionCable.server } 
  describe '#broadcast_create_changes' do
    it "broadcasts changes after reservation is created" do
      r = build(:reservation)
      expect(action_cable).to receive(:broadcast)
      r.save
    end
  end

  describe '#broadcast_destroy_changes' do
    it "broadcasts changes after reservation is destroyed" do
      r = create(:reservation)
      expect(action_cable).to receive(:broadcast)
      r.destroy
    end
  end
  describe '#time_period' do
    it "returns time period of reservation" do
      r = build(:reservation)
      expect(r.time_period).to eq("#{r.start_date.strftime("%H:%M")} - #{r.end_date.strftime("%H:%M")}")
    end
  end

  describe '#time_period_html' do
    it "returns html with time period of reservation" do
      r = build(:reservation)
      expect(r.time_period_html).to eq("<p id= 'reservation_#{r.id}'>  #{r.time_period} </p>")
    end
  end

  describe "TimeRangeValidator" do
    describe "validate" do
      it "validates if start_date is not blank" do
        r = build(:reservation, start_date: nil)
        r.save
        expect(r.errors.messages[:start_date]).to include("can't be blank")
      end

      it "validates if end_date is not blank" do
        r = build(:reservation, end_date: nil)
        r.save
        expect(r.errors.messages[:end_date]).to include("can't be blank")
      end

      it "validates that start_date is less then end_date" do
        r = build(:reservation, {start_date: Time.now, end_date: 1.hour.ago})
        r.save
        expect(r.errors.messages[:start_date]).to include("can't be greater than end time")
      end

      it "validates that time period covers only one day" do
        r = build(:reservation, {start_date: 2.days.ago, end_date: Time.now})
        r.save
        expect(r.errors.messages[:time_range]).to include("can't cover multiple days")
      end

      it "validates that reservation does not overlap with existing reservations" do
        car=create(:car)
        create(:reservation, car: car, start_date: 1.hour.ago, end_date: Time.now)
        r = build(:reservation, car: car, start_date: 30.minutes.ago)
        r.save
        expect(r.errors.messages[:time_range]).to include("is conflicting with existing reservations")
      end
    end
  end
end
