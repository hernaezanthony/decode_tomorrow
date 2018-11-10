class AddFieldsToHouse < ActiveRecord::Migration[5.1]
  def change
  	add_column :houses, :name, :string
  	add_column :houses, :bedroomCount, :string
  	add_column :houses, :floorArea, :string
  	add_column :houses, :lotArea, :string
  end
end
