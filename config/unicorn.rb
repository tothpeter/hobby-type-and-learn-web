root = "/var/www/type_and_learn_web/current"
working_directory root

# Unicorn PID file location
pid "#{root}/tmp/pids/unicorn.pid"

# Path to logs
stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"

# Unicorn socket
listen "/tmp/unicorn.type_and_learn_web.sock"

# Number of processes
worker_processes 2

timeout 30