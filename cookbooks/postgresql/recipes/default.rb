apt_package "postgresql-9.1" do
  action :install
end

bash "created-db-vagrant-user" do
  user "postgres"
  code <<-EOH
  createuser --superuser vagrant
  EOH
end
