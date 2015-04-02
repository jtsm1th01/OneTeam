class DesiredSkill < ActiveRecord::Base
  belongs_to :employee
  belongs_to :skill #is this needed?
  
  validates :skill_id, uniqueness: { scope: :employee_id }
  
end
