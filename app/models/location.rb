class Location < ActiveRecord::Base
  validates_presence_of :longitude, :latitude

  has_many :saved_locations
  has_many :users, through: :saved_locations

end
