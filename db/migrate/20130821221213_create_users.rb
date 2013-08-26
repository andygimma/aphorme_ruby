class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :twitter
      t.string :preferred_mail

      t.timestamps
    end
  end
end
