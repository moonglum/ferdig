require 'tynn'
require 'tynn/hmote'
require 'tynn/protection'
require 'todos_repository'
require 'todo'
require 'validations/create_todo'
require 'presenters/error_presenter'

Tynn.plugin(Tynn::HMote, views: File.expand_path('templates', Dir.pwd))
Tynn.plugin(Tynn::Protection)
Tynn.use(Rack::MethodOverride)

module UrlHelpers
  def parameterize(str)
    str.downcase.gsub(/\s+/, '-')
  end
end

Tynn.include(UrlHelpers)

todos_repository = Ferdig::TodosRepository.new

Tynn.define do
  root do
    res.redirect '/todos'
  end

  on 'todos' do
    get do
      render 'index.html', todos: todos_repository.all, errors: ErrorPresenter.new
    end

    post do
      validation = Ferdig::CreateTodo.new(req.params)
      todos_repository.add(Ferdig::Todo.new(validation.attributes)) if validation.valid?
      render 'index.html', todos: todos_repository.all, errors: ErrorPresenter.new(validation.errors)
    end

    on :id do
      put do
        todo = todos_repository.find_by(id: inbox[:id])
        if req.params['done'] == 'on'
          todo.tick
        else
          todo.untick
        end
        todos_repository.update(todo)
        res.redirect '/todos'
      end
    end
  end
end
