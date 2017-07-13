class Car < ApplicationRecord
  validates :number, presence: true
  has_many :reservations, :dependent => :delete_all
end
