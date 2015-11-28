require 'tynn'
require 'tynn/hmote'
require 'tynn/protection'
require 'todos_repository'
require 'todo'
require 'validations/create_todo'

Tynn.plugin(Tynn::HMote, views: File.expand_path('templates', Dir.pwd))
Tynn.plugin(Tynn::Protection)

todos_repository = Ferdig::TodosRepository.new

Tynn.define do
  root do
    get do
      todos = todos_repository.all
      render 'index.html', todos: todos
    end

    post do
      validation = Ferdig::CreateTodo.new(req.params)

      if validation.valid?
        todos_repository.add(Ferdig::Todo.new(validation.attributes))
      end

      todos = todos_repository.all
      render 'index.html', todos: todos
    end
  end
end
