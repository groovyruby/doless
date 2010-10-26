class CreateTickets < ActiveRecord::Migration
  def self.up
    create_table :tickets do |t|
      t.string :title
      t.text :description
      t.integer :priority, :default=>Ticket::PRIORITIES[:normal]
      t.string :status
      t.references :user
      t.references :project
      t.integer :responsible_id
      t.integer :scoped_id, :default=>0
      t.timestamps
    end

    add_index :tickets, :responsible_id
    add_index :tickets, :project_id
    add_index :tickets, :scoped_id
  end

  def self.down
    drop_table :tickets
  end
end
