class AddProjectIdToAssets < ActiveRecord::Migration
  def self.up
    add_column :assets, :project_id, :integer
  end

  def self.down
    remove_column :assets, :project_id
  end
end
