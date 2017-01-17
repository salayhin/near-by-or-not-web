# Define roles, user and IP address of deployment server
# role :name, %{[user]@[IP adde.]}
role :app, %w{deployer@107.170.50.26}
role :web, %w{deployer@107.170.50.26}
role :db,  %w{deployer@107.170.50.26}

# Define server(s)
server '107.170.50.26', user: 'deployer', roles: %w{web}

# SSH Options
# See the example commented out section in the file
# for more options.
set :ssh_options, {
    forward_agent: false,
    auth_methods: %w(password),
    password: 'ASDF!@#$',
    user: 'deployer',
}