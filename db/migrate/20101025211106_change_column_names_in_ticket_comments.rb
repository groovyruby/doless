class ChangeColumnNamesInTicketComments < ActiveRecord::Migration
  def self.up
    add_column :ticket_comments, :status_to, :string
    add_column :ticket_comments, :status_from, :string
    remove_column :ticket_comments, :state_to
    remove_column :ticket_comments, :state_from
  end

  def self.down
    add_column :ticket_comments, :state_to, :string
    add_column :ticket_comments, :state_from, :string
    remove_column :ticket_comments, :status_to
    remove_column :ticket_comments, :status_from
  end
end
