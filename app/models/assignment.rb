class Assignment < ActiveRecord::Base
  belongs_to :employee
  belongs_to :project_request
  has_many :reviews
  
  accepts_nested_attributes_for :reviews
  
  validates :employee, uniqueness: true

end
