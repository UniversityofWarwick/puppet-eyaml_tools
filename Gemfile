source "https://rubygems.org"

gem "hiera-eyaml"

group :test do
  gem "rake"
  gem "puppet", ENV['PUPPET_VERSION'] || '~> 4.5.0'
  gem "rspec", '< 3.2.0'
  gem "rspec-puppet", :git => 'https://github.com/rodjek/rspec-puppet.git'
  gem "puppetlabs_spec_helper"
  gem "metadata-json-lint"
  gem "rspec-puppet-facts"
end

group :development do
#  gem "travis"
#  gem "travis-lint"
#  gem "vagrant-wrapper"
#  gem "puppet-blacksmith"
#  gem "guard-rake"
end

group :system_tests do
  gem "beaker"
  gem "beaker-rspec"
end
