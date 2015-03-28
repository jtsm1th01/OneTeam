class Assignment < ActiveRecord::Base
  belongs_to :employee
  belongs_to :project_request
  has_one :review
  has_many :skill_reviews, :through => :review
  
  validates :employee, uniqueness: true

end
