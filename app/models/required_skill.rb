class RequiredSkill < ActiveRecord::Base
  belongs_to :skill #is this needed?
  belongs_to :project_request
end
