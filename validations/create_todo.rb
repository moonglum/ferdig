require 'scrivener'

module Ferdig
  class CreateTodo < Scrivener
    attr_accessor :title

    def validate
      assert_present :title
    end
  end
end
