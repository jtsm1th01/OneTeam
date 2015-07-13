class RequiredSkill < ActiveRecord::Base
  belongs_to :skill
  belongs_to :project_request
  
end
