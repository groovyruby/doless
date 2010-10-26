class CreateTicketComments < ActiveRecord::Migration
  def self.up
    create_table :ticket_comments do |t|
      t.text :description
      t.references :user
      t.references :project
      t.references :ticket
      
      t.string :state_from
      t.string :state_to
      t.integer :responsible_id_from
      t.integer :responsible_id_to
      t.integer :priority_from
      t.integer :priority_to
    end
  end

  def self.down
    drop_table :ticket_comments
  end
end
