class AddCachedSlugToTopics < ActiveRecord::Migration
  def self.up
    add_column :topics, :cached_slug, :string
  end

  def self.down
    remove_column :topics, :cached_slug
  end
end
