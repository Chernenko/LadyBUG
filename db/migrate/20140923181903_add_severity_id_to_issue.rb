class AddSeverityIdToIssue < ActiveRecord::Migration
  def change
    add_column :issues,:severity_id, :integer
    add_column :issues,:priority_id, :integer
    add_column :issues,:state_id, :integer

  end
end
