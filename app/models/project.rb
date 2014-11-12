class Project < ActiveRecord::Base
  has_many :skills
  has_many :users
  has_one :department
  has_one :location
end
