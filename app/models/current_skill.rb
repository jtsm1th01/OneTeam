class CurrentSkill < ActiveRecord::Base
  belongs_to :employee
  belongs_to :skill
end
