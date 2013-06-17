apt_package "php5" do
  action :install
end

cookbook_file "/etc/php5/conf.d/vagrant.ini" do
  source "vagrant.ini"
  owner "root"
  group "root"
  mode "0644"
end

apt_package "php5-intl" do
  action :install
end

apt_package "php5-pgsql" do
  action :install
end
