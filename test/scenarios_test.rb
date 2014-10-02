require_relative 'test_helper'
require_relative '../lib/repository'
require_relative '../lib/file_handler'

class ScenariosTest < Minitest::Test
  def test_happy_path
    handler = FileHandler.new('event_attendees.csv')
    entries = handler.entries
    repo = Repository.new(entries)

    repo.results_clear
    assert_equal 0, repo.results_count
    repo.find_by('first_name', 'John')
    assert_equal 62, repo.results_count
    repo.results_clear
    assert_equal 0, repo.results_count
  end

  def test_lets_try_printing
    handler = FileHandler.new('event_attendees.csv')
    entries = handler.entries
    repo = Repository.new(entries)

    repo.results_clear
    assert_equal 0, repo.results_count
    repo.find_by('first_name', 'John')
    repo.find_by('first_name', 'Mary')
    assert_equal 16, repo.results_count
    repo.results_sort('last_name')
    assert_equal 'Bastias', repo.results[0].last_name
    assert_equal 16, repo.results_count
  end

  def test_saving
    handler = FileHandler.new('event_attendees.csv')
    entries = handler.entries
    repo = Repository.new(entries)

    repo.results_clear
    assert_equal 0, repo.results_count
    repo.find_by('city', 'Salt Lake City')
    assert_equal 11, repo.results_count # should be 13, case sensitive
    repo.find_by('state', 'DC')
    assert_equal 236, repo.results_count
    repo.results_sort('last_name')
    assert_equal 'Abraham', repo.results.first.last_name
  end
end
