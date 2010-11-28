class CreateWorkReports < ActiveRecord::Migration
  def self.up
    create_table :work_reports do |t|
      t.text :report
      t.references :user
      t.references :project

      t.timestamps
    end
  end

  def self.down
    drop_table :work_reports
  end
end
