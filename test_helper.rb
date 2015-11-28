$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))

require 'ferdig'
require 'capybara'

ENV['RACK_ENV'] = 'test'

prepare do
  conn = PG.connect(dbname: Nomadize::Config.database_name)
  conn.exec("TRUNCATE #{ Ferdig.tables.join(',')} RESTART IDENTITY")
end

class Agent
  include Capybara::DSL
end
