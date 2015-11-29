require './test_helper'
require 'app'

def prefill(*titles)
  repo = Ferdig::TodosRepository.new
  titles.each do |title|
    repo.add(Ferdig::Todo.new(title: title))
  end
end

prepare do
  Capybara.app = Tynn
end

setup do
  Agent.new
end

test 'get index should be 200 ok' do |agent|
  agent.visit '/'
  assert_equal 200, agent.page.status_code
end

test 'get index should give a list of todos' do |agent|
  prefill('Buy milk', 'Get a new hat')
  agent.visit '/'
  agent.within '.todos' do
    assert agent.page.has_content?('Buy milk'), 'Contains first todo item'
    assert agent.page.has_content?('Get a new hat'), 'Contains second todo item'
  end
end

test 'add a todo' do |agent|
  agent.visit '/'
  agent.fill_in 'title', with: 'Something new'
  agent.click_button 'create'
  assert_equal 1, agent.all('.todos li').length
  agent.within '.todos' do
    assert agent.page.has_content?('Something new'), 'Contains created item'
  end
end

test 'do not create an empty todo item' do |agent|
  agent.visit '/'
  agent.fill_in 'title', with: ''
  agent.click_button 'create'
  assert_equal 0, agent.all('.todos li').length
  agent.within '.errors' do
    assert agent.has_content? 'Missing'
  end
end
