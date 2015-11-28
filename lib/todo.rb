require 'silueta'

module Ferdig
  class Todo
    include Silueta

    attribute :id
    attribute :title
    attribute :completed_at
  end
end
