class AddTelephoneNumberToTecknoworker < ActiveRecord::Migration
  def change
    add_column :tecknoworkers, :telephone_number, :string
  end
end
