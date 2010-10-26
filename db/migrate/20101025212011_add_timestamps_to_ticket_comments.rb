class AddTimestampsToTicketComments < ActiveRecord::Migration
  def self.up
    add_column :ticket_comments, :created_at, :datetime
    add_column :ticket_comments, :updated_at, :datetime
  end

  def self.down
    remove_column :ticket_comments, :created_at
    remove_column :ticket_comments, :updated_at 
  end
end
