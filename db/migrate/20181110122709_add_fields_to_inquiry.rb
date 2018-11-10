class AddFieldsToInquiry < ActiveRecord::Migration[5.1]
  def change
  	add_column :inquiries, :user_id, :string
  	add_column :inquiries, :name, :string
  	add_column :inquiries, :bedroomCount, :string
  	add_column :inquiries, :floorArea, :string
  	add_column :inquiries, :lotArea, :string
  	add_column :inquiries, :status, :string
  end
end
