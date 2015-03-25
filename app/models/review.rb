class Review < ActiveRecord::Base
  belongs_to :assignment
  has_one :employee, :through => :assignment
  has_one :project_request, :through => :assignment
end