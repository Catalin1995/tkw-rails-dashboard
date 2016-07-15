class CreateTecknoworkers < ActiveRecord::Migration
  def change
    create_table :tecknoworkers do |t|
      t.string :name
      t.string :mail
      t.string :locality

      t.timestamps null: false
    end
  end
end
