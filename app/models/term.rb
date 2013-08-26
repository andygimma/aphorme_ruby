class Term < ActiveRecord::Base
  has_paper_trail
  attr_accessible :batch, :bit, :byte, :origin, :previous_version_number, :term, :user_id, :version_number
  belongs_to :user
end
