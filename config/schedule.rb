every :day, :at => '12:00am' do
  rake "reports:updateUsers RAILS_ENV=production"
end

every :day, :at => '12:00am' do
  rake "reports:updateProjects RAILS_ENV=production"
end

# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end
#
# every 2.minutes do
#   runner "User.create!(:email => 'ionut', :password => 'password', password_confirmation => 'password')"
# end

# Learn more: http://github.com/javan/whenever
