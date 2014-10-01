require_relative 'test_helper'
require_relative '../lib/repository'
require_relative '../lib/file_handler'

class IntegrationTest < Minitest::Test
  def test_lookup_by_last_name
    handler = FileHandler.new('data', 'event_test.csv')
    entries = handler.entries
    repo = Repository.new(entries)

    repo.find_by('last_name', 'Hankins').sort_by { |e| e.last_name }
    assert_equal 1, repo.results_count
  end

  def test_lookup_by_zip_code
    handler = FileHandler.new('data', 'event_test.csv')
    entries = handler.entries
    repo = Repository.new(entries)

    repo.find_by('zipcode', '98122').sort_by { |e| e.zipcode }
    assert_equal 2, repo.results_count
  end

  def test_initial_repo_count
    handler = FileHandler.new('data', 'event_test.csv')
    entries = handler.entries
    repo = Repository.new(entries)
    assert_equal 0, repo.results_count
  end

  def test_count_after_lookup
    handler = FileHandler.new('data', 'event_test.csv')
    entries = handler.entries
    repo = Repository.new(entries)

    repo.find_by('zipcode', '98122').sort_by { |e| e.zipcode }
    assert_equal 2, repo.results_count
  end

  def test_count_after_lookup_and_reset
    handler = FileHandler.new('data', 'event_test.csv')
    entries = handler.entries
    repo = Repository.new(entries)

    repo.find_by('zipcode', '98122').sort_by { |e| e.zipcode }
    assert_equal 2, repo.results_count
    repo.results_clear
    assert_equal 0, repo.results_count
  end
end
