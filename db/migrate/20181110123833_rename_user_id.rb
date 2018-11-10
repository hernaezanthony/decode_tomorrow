class RenameUserId < ActiveRecord::Migration[5.1]
  def change
  	rename_column :inquiries, :user_id, :userID
  end
end
