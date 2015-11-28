require 'pg'
require 'ferdig'
require 'todo'

module Ferdig
  class TodosRepository
    def initialize
      @queries = Ferdig.create_query_group
      @queries.register(:insert, "INSERT INTO todos (title) VALUES ($1)", :title)
      @queries.register(:all, "SELECT * FROM todos;") { |raw_todo| Todo.new(raw_todo) }
    end

    def all
      @queries.run(:all)
    end

    def add(todo)
      @queries.run(:insert, title: todo.title)
    end
  end
end
