class AddFieldsToPayment < ActiveRecord::Migration[5.1]
  def change
  	add_column :payments, :userID, :string
  	add_column :payments, :amount, :string
  	add_column :payments, :date, :string
  	add_column :payments, :time, :string
  	add_column :payments, :penalty, :string
  end
end
