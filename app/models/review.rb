class Review < ActiveRecord::Base
  has_many :skill_reviews, dependent: :destroy
  belongs_to :assignment
  
  accepts_nested_attributes_for :skill_reviews, reject_if: lambda {|attributes| attributes['skill_level'].blank?}
  
end
