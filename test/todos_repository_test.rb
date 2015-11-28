require './test_helper'
require 'todos_repository'

setup do
  Ferdig::TodosRepository.new
end

test 'adding a todo item should add an item to the table' do |repo|
  assert repo.all.empty?
  todo = Ferdig::Todo.new(title: 'My first todo')
  repo.add(todo)
  assert !repo.all.empty?
end

test 'adding a todo item should set its ID' do |repo|
  todo = Ferdig::Todo.new(title: 'My first todo')
  assert_equal nil, todo.id
  repo.add(todo)
  assert_equal "1", todo.id
end

test 'get a single todo item by its ID' do |repo|
  repo.add(Ferdig::Todo.new(title: 'My first todo'))
  todo = repo.find_by(id: '1')
  assert_equal 'My first todo', todo.title
end
