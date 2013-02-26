#
# Cookbook Name:: redis
# Recipe:: _server_init

template "redis_init" do
  path "/etc/init.d/redis-server"
  variables(
    :listen_port => node['redis']['config']['listen_port'],
    :dst_dir => node['redis']['dst_dir'],
    :pid_file => node['redis']['config']['pidfile'],
    :conf_file => "redis.conf",
    :conf_dir => node['redis']['conf_dir']
  )
  source "redis_init.erb"
  owner "root"
  group "root"
  mode 0755
end

include_recipe "redis::_server_service"
