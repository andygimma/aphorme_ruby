class AddNameToSearchInfo < ActiveRecord::Migration
  def change
    add_column :search_infos, :name, :string
  end
end
