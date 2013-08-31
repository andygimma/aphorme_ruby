class RelatedTerm < ActiveRecord::Base
  attr_accessible :name, :related_term_id, :term_id
  belongs_to :term
end
