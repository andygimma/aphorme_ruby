class TermInfo < ActiveRecord::Base
  attr_accessible :ip_address, :latitude, :longitude, :term, :term_id, :user_id
  belongs_to :term
  
  geocoded_by :ip_address, :if => :ip_address_changed?
  after_validation :geocode
end
