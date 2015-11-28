$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))
require File.expand_path("app", __dir__)

run(Tynn)
