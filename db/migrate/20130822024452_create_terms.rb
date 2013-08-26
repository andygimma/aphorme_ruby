class CreateTerms < ActiveRecord::Migration
  def change
    create_table :terms do |t|
      t.string :term
      t.string :bit
      t.text :byte
      t.text :batch
      t.string :origin
      t.integer :user_id
      t.string :version_number
      t.string :previous_version_number

      t.timestamps
    end
  end
end
