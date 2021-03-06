namespace :capenv do
  desc 'copy .env to release_path'
  task :copy do
    on roles(:all) do
      path = fetch(:dotenv_target_path, release_path)
      upload! StringIO.new(Capistrano::Env.to_s), "#{path}/#{Capistrano::Env.filename}", mode: Capistrano::Env.filemode
    end
  end

  task :set_envs do
    set :default_environment, Capistrano::Env.envs
  end
end

stages.each do |stage|
  after stage, 'capenv:set_envs'
end

before 'deploy:updated', 'capenv:copy'
before 'deploy:restart', 'capenv:copy'
