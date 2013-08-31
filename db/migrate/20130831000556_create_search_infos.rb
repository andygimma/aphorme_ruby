class CreateSearchInfos < ActiveRecord::Migration
  def change
    create_table :search_infos do |t|
      t.integer :user_id
      t.float :latitude
      t.float :longitude
      t.string :ip_address
      t.string :term
      t.integer :term_id

      t.timestamps
    end
  end
end
