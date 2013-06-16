apt_package "postgresql-9.1" do
  action :install
end

execute "create-pg-user-vagrant" do
  code = <<-EOH
  psql -U postgres -c "select * from pg_user where usename='vagrant'" | grep -c vagrant
  EOH
  user "postgres"
  command "createuser --superuser vagrant"
  not_if code, :user => 'postgres'
end
