require 'tynn'
require 'tynn/hmote'
require 'tynn/protection'
require 'todos_repository'
require 'todo'
require 'validations/create_todo'
require 'presenters/error_presenter'

Tynn.plugin(Tynn::HMote, views: File.expand_path('templates', Dir.pwd))
Tynn.plugin(Tynn::Protection)

todos_repository = Ferdig::TodosRepository.new

Tynn.define do
  root do
    get do
      render 'index.html', todos: todos_repository.all, errors: ErrorPresenter.new
    end

    post do
      validation = Ferdig::CreateTodo.new(req.params)
      todos_repository.add(Ferdig::Todo.new(validation.attributes)) if validation.valid?
      render 'index.html', todos: todos_repository.all, errors: ErrorPresenter.new(validation.errors)
    end
  end
end
