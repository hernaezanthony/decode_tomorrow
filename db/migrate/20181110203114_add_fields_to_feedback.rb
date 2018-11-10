class AddFieldsToFeedback < ActiveRecord::Migration[5.1]
  def change
  	  	add_column :feedbacks, :userID, :string
  	  	add_column :feedbacks, :type, :string
  	  	add_column :feedbacks, :message, :string

  end
end
