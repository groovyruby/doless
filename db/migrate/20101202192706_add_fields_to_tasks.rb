class AddFieldsToTasks < ActiveRecord::Migration
  def self.up
    add_column :tasks, :is_completed, :boolean, :default=>false
    add_column :tasks, :is_archived, :boolean, :default=>false
  end

  def self.down
    remove_column :tasks, :is_archived
    remove_column :tasks, :is_completed
  end
end
