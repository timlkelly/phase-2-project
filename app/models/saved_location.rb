class SavedLocation < ActiveRecord::Base
  validates_presence_of :user, :location, :name

  belongs_to :user
  belongs_to :location
end
