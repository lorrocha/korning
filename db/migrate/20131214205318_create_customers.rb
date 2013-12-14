class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :account_no
      t.string :email

      t.timestamps
    end
  end
end
