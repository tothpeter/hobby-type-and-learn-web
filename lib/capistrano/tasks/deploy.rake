namespace :deploy do
  %w[start stop restart].each do |command|
    desc "#{command} Unicorn server."
    task command do
      on roles(:app) do
        execute "/etc/init.d/unicorn_#{fetch(:application)} #{command}"
      end
    end
  end

  after :deploy, "deploy:restart"
  after :rollback, "deploy:restart"
end
