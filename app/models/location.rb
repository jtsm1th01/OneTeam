class Location < ActiveRecord::Base
  belongs_to :users
  belongs_to :projects
end
