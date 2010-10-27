class CreateAssets < ActiveRecord::Migration
  def self.up
    create_table :assets do |t|
      t.references :user
      t.string :asset_file_name
      t.string :asset_content_type
      t.string :asset_file_size
      t.string :attachable_type
      t.integer :attachable_id

      t.timestamps
    end
  end

  def self.down
    drop_table :assets
  end
end
