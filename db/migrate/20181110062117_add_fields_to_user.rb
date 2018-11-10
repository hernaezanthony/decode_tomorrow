class AddFieldsToUser < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :first_name, :string
  	add_column :users, :last_name, :string
  	add_column :users, :address, :string
  	add_column :users, :mobile_number, :string
  	add_column :users, :landline_number, :string
  end
end
