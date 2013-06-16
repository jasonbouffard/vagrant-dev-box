bash "apt-get-upgrade" do
  user "root"
  code <<-EOH
  apt-get -y update
  DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade
  EOH
end
