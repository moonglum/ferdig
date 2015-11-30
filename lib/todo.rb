require 'silueta'

module Ferdig
  class Todo
    include Silueta

    attribute :id
    attribute :title
    attribute :completed_at

    def done?
      !self.completed_at.nil?
    end

    def tick
      self.completed_at = Time.now
    end

    def untick
      self.completed_at = nil
    end
  end
end
