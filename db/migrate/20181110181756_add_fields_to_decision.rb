class AddFieldsToDecision < ActiveRecord::Migration[5.1]
  def change
  	  	add_column :decisions, :status, :string
  		add_column :decisions, :message, :string
  end
end
