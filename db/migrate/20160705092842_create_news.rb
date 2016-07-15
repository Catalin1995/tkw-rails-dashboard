class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :image

      t.timestamps null: false
    end
  end
end
