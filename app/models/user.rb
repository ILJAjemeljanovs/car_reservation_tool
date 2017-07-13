class User < ApplicationRecord
  validates :name, presence: true
  has_many :reservations, :dependent => :delete_all
end
