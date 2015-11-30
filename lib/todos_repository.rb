require 'pg'
require 'ferdig'
require 'todo'

module Ferdig
  class TodosRepository
    def initialize(model = Todo)
      @queries = Ferdig.create_query_group
      @queries.register(:insert, "INSERT INTO todos (title) VALUES ($1) RETURNING id, title, completed_at", :title)
      @queries.register(:all, "SELECT * FROM todos ORDER BY id;") { |raw_todo| model.new(raw_todo) }
      @queries.register(:find, "SELECT * FROM todos WHERE id = $1", :id) { |raw_todo| model.new(raw_todo) }
      @queries.register(:delete, "DELETE FROM todos WHERE id = $1", :id)
      @queries.register(:update, "UPDATE todos SET title = $1, completed_at = $2 WHERE id = $3", :title, :completed_at, :id)
    end

    def all
      @queries.run(:all)
    end

    def add(todo)
      result = @queries.run(:insert, title: todo.title).first
      todo.update(result)
    end

    def find_by(id:)
      @queries.run(:find, id: id).first
    end

    def delete_by(id:)
      @queries.run(:delete, id: id)
    end

    def update(todo)
      @queries.run(:update, title: todo.title, completed_at: todo.completed_at, id: todo.id)
    end
  end
end
