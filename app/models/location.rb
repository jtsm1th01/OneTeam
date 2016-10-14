class Location < ActiveRecord::Base
  has_many :employees
  validates :location_name, presence: true, uniqueness: true
end
