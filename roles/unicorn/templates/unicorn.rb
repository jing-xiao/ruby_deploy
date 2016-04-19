# set path to application
base_dir = File.expand_path("../..", __FILE__)
app_dir = "#{base_dir}/public";
shared_dir = "#{base_dir}/shared"
working_directory app_dir


# Set unicorn options
worker_processes 2
preload_app true
timeout 30

# Set up socket location
#listen "#{shared_dir}/sockets/unicorn.sock", :backlog => 64
listen {{unicorn_port}}, :tcp_nopush => true

# Logging
stderr_path "#{base_dir}/log/unicorn.stderr.log"
stdout_path "#{base_dir}/log/unicorn.stdout.log"

# Set master PID location
pid "#{base_dir}/pid/unicorn.pid"
