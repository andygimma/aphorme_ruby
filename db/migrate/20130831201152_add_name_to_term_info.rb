class AddNameToTermInfo < ActiveRecord::Migration
  def change
    add_column :term_infos, :name, :string
  end
end
