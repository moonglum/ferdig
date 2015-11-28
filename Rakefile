require 'nomadize/tasks'
require 'nomadize'

task :test => ['db:test:prepare'] do
  exec 'cutest test/*.rb'
end

task :server do
  exec 'rackup --port 3000 --host 0.0.0.0'
end

namespace :db do
  namespace :test do
    task :prepare do
      ENV['RACK_ENV'] = 'test'
      Nomadize.drop_database
      Nomadize.create_database
      Nomadize.run_migrations
    end
  end
end

task :default => [:test]
