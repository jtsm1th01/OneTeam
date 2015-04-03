class RequiredSkill < ActiveRecord::Base
  belongs_to :skill
  belongs_to :project_request
  
  validates :skill_id, uniqueness: { scope: :project_request_id }
  
end
