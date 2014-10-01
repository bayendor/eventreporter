require_relative 'test_helper'

require_relative '../lib/event_reporter'

class IntegrationTest < Minitest::Test
  def test_lookup_by_last_name
    repo = EventReporter.new

    repo.lookup('Hankins').sort_by { |e| e.last_name }
    assert_equal 1, repo.find_count
  end

  def test_lookup_by_zip_code
    repo = EventReporter.new

    repo.zip_code_lookup('98122').sort_by { |e| e.zipcode }
    assert_equal 2, repo.find_count
  end

  def test_initial_repo_count
    repo = EventReporter.new
    assert_equal 0, repo.find_count
  end

  def test_count_after_lookup
    repo = EventReporter.new

    repo.zip_code_lookup('98122').sort_by { |e| e.zipcode }
    assert_equal 2, repo.find_count
  end

  def test_count_after_lookup_and_reset
    repo = EventReporter.new

    repo.zip_code_lookup('98122').sort_by { |e| e.zipcode }
    assert_equal 2, repo.find_count
    repo.clear
    assert_equal 0, repo.find_count
  end
end
