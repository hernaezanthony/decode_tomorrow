class AddMoreFieldsToDecision < ActiveRecord::Migration[5.1]
  def change
  	add_column :decisions, :userID, :string
  	add_column :decisions, :inquiryID, :string
  end
end
