gem 'minitest', '~> 5.4'
require 'minitest/autorun'

require_relative '../lib/eventreporter'

class IntegrationTest < Minitest::Test
  def test_lookup_by_last_name
    repo = EventReporter.new

    entries = repo.lookup('Hankins').sort_by { |e| e.last_name }
    assert_equal 1, entries.length
  end

  def test_lookup_by_zip_code
    repo = EventReporter.new

    entries = repo.zip_code_lookup('98122').sort_by { |e| e.zipcode }
    assert_equal 2, entries.length
  end

end
