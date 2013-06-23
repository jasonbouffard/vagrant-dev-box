apt_package "acl" do
  action :install
end

ruby_block "enable acl" do
  block do
    if File.readlines("/etc/fstab").grep(/defaults,acl/).size == 0
      rc = Chef::Util::FileEdit.new("/etc/fstab")
      rc.search_file_replace(/defaults/, "defaults,acl")
      rc.write_file
    end
  end
end
