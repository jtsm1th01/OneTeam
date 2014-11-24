class Skill < ActiveRecord::Base
  belongs_to :users
  has_many :project_requests
end
