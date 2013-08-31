class Term < ActiveRecord::Base
  has_paper_trail
  attr_accessible :batch, :bit, :byte, :origin, :previous_version_number, :term, :user_id, :version_number, :name
  
  belongs_to :user
  has_many :term_infos
  has_many :search_infos
  has_many :related_terms

end
