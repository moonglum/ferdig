require 'nomadize/tasks'
require 'nomadize'

task :test => ['db:test:prepare'] do
  exec 'cutest test/*.rb'
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
