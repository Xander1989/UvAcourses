class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :studienummer
      t.string :email

      t.timestamps
    end
  end
end
