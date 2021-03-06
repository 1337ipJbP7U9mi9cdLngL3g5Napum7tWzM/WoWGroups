require File.expand_path("./environment", __dir__)

# Change these
server Rails.application.credentials.linode[:ip], roles: [:web, :app, :db], primary: true

set :repo_url,        'git@github.com:1337ipJbP7U9mi9cdLngL3g5Napum7tWzM/WoWGroups.git'
set :application,     'WoWGroups'
set :user,            Rails.application.credentials.linode[:user]
set :puma_threads,    [4, 16]
set :puma_workers,    0

# Don't change these unless you know what you're doing
set :pty,             true
set :use_sudo,        false
set :stage,           :production
set :deploy_via,      :remote_cache
set :deploy_to,       "/home/#{fetch(:user)}/#{fetch(:application)}"
set :puma_bind,       "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.error.log"
set :puma_error_log,  "#{release_path}/log/puma.access.log"
set :ssh_options,     { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa_linode) }
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true  # Change to true if using ActiveRecord

## Defaults:
# set :scm,           :git
# set :branch,        :master
# set :format,        :pretty
# set :log_level,     :debug
set :keep_releases, 2

## Linked Files & Directories (Default None):
set :linked_files, %w{config/database.yml config/boot.rb config/application.rb}
set :linked_files, fetch(:linked_files, []).push("config/master.key")
set :linked_dirs,  %w{bin tmp/pids tmp/cache tmp/sockets public}
# set :linked_dirs, %w{.bundle}
# set :assets_prefix, 'packs'

# Rake::Task["deploy:assets:backup_manifest"].clear_actions

set :nginx_use_ssl, true
set :nginx_server_name, "worldofwarcraftgroups.com www.worldofwarcraftgroups.com"
set :nginx_ssl_certificate, "/etc/letsencrypt/live/worldofwarcraftgroups.com/fullchain.pem"
set :nginx_ssl_certificate_key, "/etc/letsencrypt/live/worldofwarcraftgroups.com/privkey.pem"


namespace :puma do
  desc 'Create Directories for Puma Pids and Socket'
  task :make_dirs do
    on roles(:app) do
      execute "mkdir #{shared_path}/tmp/sockets -p"
      execute "mkdir #{shared_path}/tmp/pids -p"
    end
  end

  before :start, :make_dirs
end

namespace :deploy do
  desc "Make sure local git is in sync with remote."
  task :check_revision do
    on roles(:app) do
      unless `git rev-parse HEAD` == `git rev-parse origin/master`
        puts "WARNING: HEAD is not the same as origin/master"
        puts "Run `git push` to sync changes."
        exit
      end
    end
  end

  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      before 'deploy:restart', 'puma:start'
      invoke 'deploy'
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke 'puma:restart'
    end
  end

  before :starting,     :check_revision
  # after 'deploy:updated', 'assets:precompile'
  # after  :finishing,    :compile_assets
  after  :finishing,    :cleanup
  after  :finishing,    :restart
end

# ps aux | grep puma    # Get puma pid
# kill -s SIGUSR2 pid   # Restart puma
# kill -s SIGTERM pid   # Stop puma
