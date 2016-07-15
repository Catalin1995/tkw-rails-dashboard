class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :pid
      t.string :key
      t.string :name
      t.string :description
      t.string :project_type_key
      t.string :leader_name
      t.integer :code_review_issue_count
      t.integer :total_time_spent_in_seconds
      t.integer :total_worklog_count
      t.integer :total_time_spent_on_project
      t.integer :total_time_spent_last_year
      t.string :last_activity
      t.string :first_activity

      t.timestamps null: false
    end
  end
end
