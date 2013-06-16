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
