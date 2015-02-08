class DesiredSkill < ActiveRecord::Base
  belongs_to :employee
  belongs_to :skill #is this needed?
end
