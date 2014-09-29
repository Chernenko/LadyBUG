class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :username
      t.timestamps
    end
  end
end
