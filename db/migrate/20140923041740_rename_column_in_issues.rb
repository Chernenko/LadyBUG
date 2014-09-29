class RenameColumnInIssues < ActiveRecord::Migration
  def change
    rename_column :issues, :username, :title
    add_column :issues, :description, :text
    add_column :issues, :user_id, :integer
  end
end
