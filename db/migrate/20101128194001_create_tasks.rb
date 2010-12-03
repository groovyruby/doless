class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.string :title
      t.references :project
      t.references :user
      t.boolean :is_starred, :default=>false

      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
