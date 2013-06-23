apt_package "apache2" do
  action :install
end

link "/etc/apache2/sites-enabled/000-default" do
  action :delete
end

template "site.conf" do
  path "/etc/apache2/sites-available/site-#{node['name']}.conf"
  source "site.conf.erb"
  owner "root"
  group "root"
  mode "0644"
end

link "/etc/apache2/sites-enabled/site-#{node['name']}.conf" do
  to "/etc/apache2/sites-available/site-#{node['name']}.conf"
end

directory node['project_dir'] do
  owner 'vagrant'
  group 'vagrant'
  action :create
end

directory node['project_dir']+node['web_path'] do
  owner 'vagrant'
  group 'vagrant'
  action :create
end

cookbook_file File.join("#{node['project_dir']}", "#{node['web_path']}", "app.php") do
  source "app.php"
  owner "vagrant"
  group "vagrant"
  mode "0644"
end
