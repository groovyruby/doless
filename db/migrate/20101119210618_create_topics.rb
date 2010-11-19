class CreateTopics < ActiveRecord::Migration
  def self.up
    create_table :topics do |t|
      t.string :title
      t.references :user
      t.references :project
      
      t.timestamps
    end

    create_table :topics_users, :id=>false do |t|
      t.references :topic
      t.references :user
    end
  end

  def self.down
    drop_table :topics_users
    drop_table :topics
  end
end
