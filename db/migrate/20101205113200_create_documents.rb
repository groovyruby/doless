class CreateDocuments < ActiveRecord::Migration
  def self.up
    create_table :documents do |t|
      t.string :title
      t.text :content
      t.boolean :is_main, :default=>false
      t.references :project
      t.references :user
      t.integer :changed_by_id

      t.timestamps
    end
  end

  def self.down
    drop_table :documents
  end
end
