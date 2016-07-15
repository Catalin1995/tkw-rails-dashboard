class AddJiraRequestDateToProject < ActiveRecord::Migration
  def change
    add_column :projects, :jira_request_date, :integer
  end
end
