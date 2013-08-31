class CreateRelatedTerms < ActiveRecord::Migration
  def change
    create_table :related_terms do |t|
      t.integer :term_id
      t.integer :related_term_id
      t.string :name

      t.timestamps
    end
  end
end
