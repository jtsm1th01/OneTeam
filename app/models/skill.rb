class Skill < ActiveRecord::Base
  belongs_to :users
  belongs_to :project_requests
end
