json.code 200
json.body do |json|
  json.projects do |json|
    json.partial! 'project', collection: @projects, as: :project
  end
  json.activeProjects @projects.count
  json.codeReviewWorklogs @projects.inject(0){ |sum, project| sum += project.total_worklog_count }
  json.codeReviewProjects @projects.select { |project| project.code_review_issue_count > 0 }.size
  json.codeReviewTime @projects.inject(0){ |sum, project| sum += project.total_time_spent_in_seconds }
end
