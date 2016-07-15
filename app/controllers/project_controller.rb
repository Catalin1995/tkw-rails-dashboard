class ProjectController < ApplicationController

  def index
    last_request_date = Project.pluck(:jira_request_date).uniq.max
    @projects = Project.where(jira_request_date: last_request_date)
  end

  def graph
    project = Project.all

    @rez = {}
    time_now = Time.now()

    project.each do |project|
      time = Time.at(project.jira_request_date.to_i)

      week = time.strftime("%W").to_i.to_s
      year = time.year().to_s
      wday = time.wday.to_i.to_s

      if (!@rez.has_key?(year))
        @rez[year] = {}
      end

      if (!@rez[year].has_key?(week))
        begin
          @rez[year][week] = {
            "first_day" => Date.commercial(year.to_i, week.to_i, 1),
            "last_day" => Date.commercial(year.to_i, week.to_i, 7),
            "days" => { }
          }
        rescue
        end
      end

      if (@rez[year].has_key? week)
        if (!@rez[year][week]["days"].has_key? wday)
          @rez[year][week]["days"][wday] = [
            {
              "codeReviewProjects" => 0,
              "onTrackProjects" => 0,
              "fullCodeReviewProjects" => []
            }
          ]
        end
        if (project.code_review_issue_count > 0)
          @rez[year][week]["days"][wday][0]["codeReviewProjects"] += 1
          @rez[year][week]["days"][wday][0]["fullCodeReviewProjects"].push project.name
        end
        if (project.status == 'on track')
          @rez[year][week]["days"][wday][0]["onTrackProjects"] += 1
        end
      end
    end
  end
end
