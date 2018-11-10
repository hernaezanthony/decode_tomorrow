class AddFieldsToConstruction < ActiveRecord::Migration[5.1]
  def change
  	add_column :constructions, :status, :string
  	add_column :constructions, :userID, :string
  end
end
