# Install required packages
%w{ruby1.9.3 libxslt-dev libxml2-dev curl}.each do |pkg|
  package pkg do
    action :install
  end
end
gem_package "bundler" do
  gem_binary "/usr/bin/gem"
end

# Install required gems via bundler
script "bundle" do
  interpreter "bash"
  cwd "/vagrant"
  code "bundle install"
end

include_recipe "passenger_apache2::mod_rails"
  
execute "disable-default-site" do
  command "sudo a2dissite default"
end

web_app "orcid-feed" do
  docroot "/vagrant/public"
  template "orcid-feed.conf.erb"
  notifies :reload, resources(:service => "apache2"), :delayed
end