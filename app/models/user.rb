class User < ActiveRecord::Base
  has_and_belongs_to_many :skills
  belongs_to :location
  belongs_to :department
  has_one :title
  belongs_to :group
  has_many :project_requests
end
