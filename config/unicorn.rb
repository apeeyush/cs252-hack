# Set the working application directory
# working_directory "/path/to/your/app"
working_directory "~/cs252-dropbox/my-dropbox"

# Unicorn PID file location
# pid "/path/to/pids/unicorn.pid"
pid "~/cs252-dropbox/my-dropbox/pids/unicorn.pid"

# Path to logs
# stderr_path "/path/to/log/unicorn.log"
# stdout_path "/path/to/log/unicorn.log"
stderr_path "~/cs252-dropbox/my-dropbox/log/unicorn.log"
stdout_path "~/cs252-dropbox/my-dropbox/log/unicorn.log"

# Unicorn socket
listen "/tmp/unicorn.[app name].sock"
listen "/tmp/unicorn.myapp.sock"

# Number of processes
# worker_processes 4
worker_processes 2

# Time-out
timeout 30