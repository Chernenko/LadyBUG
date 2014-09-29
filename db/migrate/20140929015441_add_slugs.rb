class AddSlugs < ActiveRecord::Migration
  def change
    add_column :users, :slug, :string
    add_column :projects, :slug, :string
    add_column :issues, :slug, :string
  end
end
