class RenameFieldAtFeedback < ActiveRecord::Migration[5.1]
  def change
  rename_column :feedbacks, :type, :feedbackType
  end
end
