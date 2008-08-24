set :application, "nsite"
set :repository,  "git@github.com:dustin/noelani.git"
set :user, application
set :runner, application

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "/home/#{application}"

set :scm, :git
set :branch, "master"
set :deploy_via, :remote_cache

role :app, "69.56.173.84"
role :web, "69.56.173.84"
role :db,  "69.56.173.84", :primary => true

depend :remote, :command, "git"
depend :remote, :gem, "SyslogLogger", ">= 1.4"
depend :remote, :gem, "memcache-client", ">= 1.5"
depend :remote, :gem, "sqlite3-ruby", "> 1.2"
depend :remote, :gem, "god", "> 0.7"
depend :remote, :gem, "BlueCloth", ">= 1.0.0"
depend :remote, :gem, "haml", ">= 2.0"

desc "Starting and stopping via god."
deploy.task :start do
  sudo "god load #{deploy_to}/current/config/god.config"
  sudo "god start #{application}"
end

desc "Starting and stopping via god."
deploy.task :restart do
  sudo "god restart #{application}"
end

desc "Starting and stopping via god."
deploy.task :stop do
  sudo "god stop #{application}"
  sudo "god remove #{application}"
end

