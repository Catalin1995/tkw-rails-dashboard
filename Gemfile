source 'https://rubygems.org'

gem 'net-ldap'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.2.4', git: "git://github.com/rails/rails.git", branch: '4-2-stable'

gem 'capistrano-rvm'

# gem 'whenever'

#gem 'tkw-ldap', :git => 'git@gitlab.st.st2k.ro:ionut.muresan/tkw-ldap.git'

gem 'jira-ruby', '~> 0.1.18'

#gem 'jira-cli', :git => 'git@gitlab.st.st2k.ro:cristian.messel/jira-cli.git'

#gem 'jira-cli', :git => 'git@gitlab.st.st2k.ro:cristian.messel/jira-cli.git'

gem 'apipie-rails'
# Use sqlite3 as the database for Active Record
# gem 'sqlite3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

gem 'hirb' # pretty formatting in rails console

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Used for authentication
gem 'devise'

# Admin interface
gem 'activeadmin', github: 'activeadmin/activeadmin'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

gem 'mysql2'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'carrierwave'

group :development, :test do
  gem 'lol_dba'

  gem 'rubocop'

  gem 'metric_fu'

  gem 'guard-rubocop'

  gem 'capistrano-ssh-doctor', '~> 1.0'

  # used for renaming the app
  gem 'rename'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  gem 'factory_girl_rails', '~> 4.0'

  gem 'rspec-rails', '~> 3.0'

  gem 'guard-rspec', require: false

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :development do
    gem 'capistrano',         require: false
    gem 'capistrano-rvm',     require: false
    gem 'capistrano-rails',   require: false
    gem 'capistrano-bundler', require: false
    gem 'capistrano3-puma',   require: false
end

gem 'puma'
