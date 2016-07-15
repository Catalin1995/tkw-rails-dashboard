FactoryGirl.define do
  factory :project do
    pid 1
    key 'MyString'
    name 'MyString'
    description '---- { "status": "On hold", "client": "test" }'
    project_type_key 'MyString'
    leader_name 'MyString'
    code_review_issue_count 1
    total_time_spent_in_seconds 1
    total_worklog_count 1
    total_time_spent_on_project 1
    total_time_spent_last_year 1
    last_activity 'MyString'
    first_activity 'MyString'
    jira_request_date Date.today.to_time.to_i
  end
end
