require 'pp'
require 'json'

User.create!(email: 'admin@example.com  ', password: 'password', password_confirmation: 'password', admin: true)

def add_projects_to_db projects, date
  projects.each do |project|
    Project.create!(
    pid: project['id'],
    key: project['key'],
    name: project['name'],
    description: project['description'],
    project_type_key: project['project_type_key'],
    leader_name: project['leader_name'],
    code_review_issue_count: project['code_review_issue_count'],
    total_time_spent_in_seconds: project['total_time_spent_in_seconds'],
    total_worklog_count: project['total_worklog_count'],
    total_time_spent_on_project: project['total_time_spent_on_project'],
    total_time_spent_last_year: project['total_time_spent_last_year'],
    last_activity: project['last_activity'],
    first_activity: project['first_activity'],
    jira_request_date: date
    )
  end
end

def import_projects
  files = Dir['db/reports/report.*.json'].sort

  files.each do |f|
    arr = f.split('.')

    if arr.size == 3
      timestamp = arr[1]
      json = JSON.parse(File.read(f))

      add_projects_to_db(json['projects'], arr[1])
    end
  end
end

def add_tecknoworker_to_db data
  data.each do |d|
    d['users'].each do |user|
      Tecknoworker.create!(locality: d['key'], name: user['name'], mail: user['mail'], telephone_number: user['telephonenumber'])
    end
  end
  pp data[0]
end

def import_tecknoworkers
  file = "db/reports/users.json"

  json = JSON.parse(File.read(file))

  add_tecknoworker_to_db(json)
end

import_projects
import_tecknoworkers
