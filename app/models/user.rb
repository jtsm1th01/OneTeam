class User < ActiveRecord::Base
  has_many :skills
  has_many :projects
  has_one :location
  has_one :department
  has_one :title
  has_many :project_requests
end
