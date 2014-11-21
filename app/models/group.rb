class Group < ActiveRecord::Base
  has_many :project_requests
  has_many :users
end
