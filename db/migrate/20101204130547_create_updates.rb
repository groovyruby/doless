class CreateUpdates < ActiveRecord::Migration
  def self.up
    create_table :updates do |t|
      t.text :body
      t.references :user
      t.timestamps
    end
  end

  def self.down
    drop_table :updates
  end
end
