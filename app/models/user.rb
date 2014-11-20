class User < ActiveRecord::Base
  has_many :skills
  has_one :location
  has_one :department
  has_one :title
  has_one :group
  has_many :project_requests
  has_one :user
end
