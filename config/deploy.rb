require 'bundler/capistrano'
#require "whenever/capistrano"
#require "delayed/recipes"

set :application, "loaner"
set :repository,  "git@github.com:pronix/loaner.git"

role :web, "loaner.vlad.org.ua"
role :app, "loaner.vlad.org.ua"
role :db,  "loaner.vlad.org.ua", :primary => true

set :keep_releases, 5
# we don't need sudo
set :use_sudo, false
set :use_chmod, false

set(:deploy_to) { "/var/www/apps/#{application}" }
set :deploy_via, :copy

set :user, "loaner"
set :group, "apps"

set :branch, "master"

set :scm, "git"
set :scm_verbose, true

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
