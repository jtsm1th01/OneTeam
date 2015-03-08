class CurrentSkill < ActiveRecord::Base
  belongs_to :employee
  belongs_to :skill #are these necessary?
end
