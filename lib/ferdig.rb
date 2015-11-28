require 'nomadize/config'
require 'sql_capsule'

module Ferdig
  # Connection to the database of the current environment
  def self.database_connection
    @@database_connection ||= PG.connect(dbname: Nomadize::Config.database_name)
  end

  # Database tables in use
  def self.tables
    [ 'todos' ]
  end

  # Create a new SQLCapsule query group
  def self.create_query_group
    SQLCapsule.wrap(self.database_connection)
  end
end
