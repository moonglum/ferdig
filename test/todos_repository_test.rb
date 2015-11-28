require './test_helper'
require 'todos_repository'

test 'adding a todo item should add an item to the table' do
  repo = Ferdig::TodosRepository.new
  assert repo.all.empty?
  todo = Ferdig::Todo.new(title: 'My first todo')
  repo.add(todo)
  assert !repo.all.empty?
end

test 'adding a todo item should set its ID' do
  repo = Ferdig::TodosRepository.new
  todo = Ferdig::Todo.new(title: 'My first todo')
  assert_equal nil, todo.id
  repo.add(todo)
  assert_equal "1", todo.id
end
