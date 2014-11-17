class Project < ActiveRecord::Base
  has_many :skills
  has_many :users
  has_many :project_requests
end
