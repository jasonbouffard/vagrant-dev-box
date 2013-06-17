bash "apt-get-update" do
  user "root"
  code <<-EOH
  apt-get -y update
  EOH
end

bash "apt-get-dist-upgrade" do
  user "root"
  code <<-EOH
  # https://github.com/mitchellh/vagrant/issues/289#issuecomment-12408200
  DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade
  EOH
end

apt_package "make" do
  action :install
end

execute "rebuild-vbox-guest-additions" do
  code = <<-EOH
  lsmod | grep -c vboxsf
  EOH
  user "root"
  command "/etc/init.d/vboxadd setup"
  not_if code
end

directory node['project_dir'] do
  owner 'vagrant'
  group 'vagrant'
  action :create
end
