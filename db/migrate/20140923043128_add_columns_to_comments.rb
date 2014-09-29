class AddColumnsToComments < ActiveRecord::Migration
  def change
    add_column :comments, :user_id,  :integer
    add_column :comments, :issue_id, :integer
    add_column :issues, :project_id, :integer
  end
end
