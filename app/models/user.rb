class User < ActiveRecord::Base
  has_many :skills
  belongs_to :location
  belongs_to :department
  has_one :title
  belongs_to :group
  has_and_belongs_to_many :project_requests
end
