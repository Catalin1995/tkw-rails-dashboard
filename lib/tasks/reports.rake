# require 'jira-ruby'
namespace :reports do

  desc 'update users from db'
  task :updateUsers => :environment do
    Tecknoworker.delete_all
    options = {
      :user => ENV['JOBS_LDAP_USER'],
      :pass => ENV['JOBS_LDAP_PASS'],
      :host => ENV['JOBS_LDAP_HOST'],
      :base_dn => ENV['JOBS_LDAP_BASE_DN']
    }
    locations = ['Cluj-Napoca', 'Deva', 'Oradea', 'Unknown']
    ldapCtr = LdapController.new
    tecknoworkers = ldapCtr.users
    tecknoworkers[:list_of_users].each do |tecknoworker|
      if !tecknoworker[:physicaldeliveryofficename] || locations.include?(tecknoworker[:physicaldeliveryofficename])
        Tecknoworker.create!(
          locality: tecknoworker[:physicaldeliveryofficename] || "Unknown",
          name: tecknoworker[:name],
          mail: tecknoworker[:mail],
          telephone_number: tecknoworker[:telephonenumber]
        )
      end
    end
  end

  desc 'update projects'
  task :updateProjects => :environment do
    options = {
      :username => ENV["JIRA_USERNAME"],
      :password => ENV["JIRA_PASSWORD"],
      :site => ENV["JIRA_SITE"],
      :context_path => '',
      :auth_type => :basic,
      :use_ssl => true,
      :ssl_verify_mode => 0
    }

    fields = [:worklog]

    credentials = Credentials.new(options)

    repCtrl = ReportController.new(credentials)

    data = repCtrl.projects(fields)

    jira_request_date = Date.today.to_time.to_i

    projects = Project.where(:jira_request_date => jira_request_date)

    projects.delete_all

    data[:projects].each do |project|
      Project.create!(
      pid: project[:id],
      key: project[:key],
      name: project[:name],
      description: project[:description],
      project_type_key: project[:project_type_key],
      leader_name: project[:leader_name],
      code_review_issue_count: project[:code_review_issue_count],
      total_time_spent_in_seconds: project[:total_time_spent_in_seconds],
      total_worklog_count: project[:total_worklog_count],
      total_time_spent_on_project: project[:total_time_spent_on_project],
      total_time_spent_last_year: project[:total_time_spent_last_year],
      last_activity: project[:last_activity],
      first_activity: project[:first_activity],
      jira_request_date: jira_request_date
      )
    end

  end
end
