# config valid only for Capistrano 3.1
lock '3.2.1'

set :rails_env, :production
set :application, 'linusapp'
set :scm, :git
set :format, :pretty
set :repo_url, 'git@github.com:linusapp/linus.git'
set :branch, 'master'
set :deploy_via, :remote_cache
set :deploy_to, '/srv/linusapp'
set :ssh_options, {
  keys: %w(/Users/pierce/.ssh/me_prex_io.key),
  forward_agent: true,
  auth_methods: %w(publickey)
}
set :linked_files, %w{config/linus.env.development config/linus.env.production}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
set :keep_releases, 5
set :sidekiq_env, :production

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
    end
  end
end
