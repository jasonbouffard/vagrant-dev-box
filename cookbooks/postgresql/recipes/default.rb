apt_package "postgresql-9.1" do
  action :install
end

bash "created-pg-user-vagrant" do
  user "postgres"
  code <<-EOH
  createuser --superuser vagrant
  EOH
end
