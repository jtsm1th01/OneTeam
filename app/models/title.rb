class Title < ActiveRecord::Base
  validates :title_name, presence: true, uniqueness: true
  has_many :employees
end
