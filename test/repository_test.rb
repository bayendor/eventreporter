require_relative 'test_helper'

require_relative '../lib/repository'

class RepositoryTest < Minitest::Test

  def test_retrieve_by_first_name
    entries = [
      { regdate: '11/12/08 10:47', first_name: 'Allison', last_name: 'Nguyen', email_address: 'arannon@jumpstartlab.com', homephone: '6154385000', street: '3155 19th St NW', city: 'Washington', state: 'DC', zipcode: '20010' },
      { regdate: '11/12/08 10:47', first_name: 'Allison', last_name: 'Nguyen', email_address: 'arannon@jumpstartlab.com', homephone: '6154385000', street: '3155 19th St NW', city: 'Washington', state: 'DC', zipcode: '20010' },
    ].map { |row| Entry.new(row) }

    repository = Repository.new(entries)
    entries = repository.find_by('first_name', 'Allison').sort_by(&:first_name)
    assert_equal 2, entries.length
  end

  def test_retrieve_by_last_name
    entries = [
      { regdate: '11/12/08 10:47', first_name: 'Allison', last_name: 'Nguyen', email_address: 'arannon@jumpstartlab.com', homephone: '6154385000', street: '3155 19th St NW', city: 'Washington', state: 'DC', zipcode: '20010' },
      { regdate: '11/12/08 10:47', first_name: 'Allison', last_name: 'Nguyen', email_address: 'arannon@jumpstartlab.com', homephone: '6154385000', street: '3155 19th St NW', city: 'Washington', state: 'DC', zipcode: '20010' },
    ].map { |row| Entry.new(row) }

    repository = Repository.new(entries)
    entries = repository.find_by('last_name', 'Nguyen').sort_by(&:first_name)
    assert_equal 2, entries.length
  end

  def test_retrieve_by_zipcode
  entries = [
      { regdate: '11/12/08 10:47', first_name: 'Allison', last_name: 'Nguyen', email_address: 'arannon@jumpstartlab.com', homephone: '6154385000', street: '3155 19th St NW', city: 'Washington', state: 'DC', zipcode: '20010' },
      { regdate: '11/12/08 10:47', first_name: 'Allison', last_name: 'Nguyen', email_address: 'arannon@jumpstartlab.com', homephone: '6154385000', street: '3155 19th St NW', city: 'Washington', state: 'DC', zipcode: '20010' },
    ].map { |row| Entry.new(row) }

    repository = Repository.new(entries)
    entries = repository.find_by('zipcode','20010').sort_by(&:zipcode)
    assert_equal 2, entries.count
  end

  def test_retrieve_by_state
    entries = [
      { regdate: '11/12/08 10:47', first_name: 'Allison', last_name: 'Nguyen', email_address: 'arannon@jumpstartlab.com', homephone: '6154385000', street: '3155 19th St NW', city: 'Washington', state: 'DC', zipcode: '20010' },
      { regdate: '11/12/08 10:47', first_name: 'Allison', last_name: 'Nguyen', email_address: 'arannon@jumpstartlab.com', homephone: '6154385000', street: '3155 19th St NW', city: 'Washington', state: 'DC', zipcode: '20010' },
    ].map { |row| Entry.new(row) }

    repository = Repository.new(entries)
    entries = repository.find_by('state', 'DC').sort_by(&:state)
    assert_equal 2, entries.count
  end

  def test_case_insensitive_search
    entries = [
      { regdate: '11/12/08 10:47', first_name: 'Allison', last_name: 'Nguyen', email_address: 'arannon@jumpstartlab.com', homephone: '6154385000', street: '3155 19th St NW', city: 'Washington', state: 'DC', zipcode: '20010' },
      { regdate: '11/12/08 10:47', first_name: 'Allison', last_name: 'Nguyen', email_address: 'arannon@jumpstartlab.com', homephone: '6154385000', street: '3155 19th St NW', city: 'Washington', state: 'DC', zipcode: '20010' }
    ].map { |row| Entry.new(row) }

    repository = Repository.new(entries)
    entries = repository.find_by('state', 'DC').sort_by(&:state)
    assert_equal 2, entries.count
  end

  def test_empty_count
    entries = []
    repository = Repository.new(entries)
    assert_equal 0, repository.results_count
  end

  def test_non_empty_count
    entries = [
      { regdate: '11/12/08 10:47', first_name: 'Allison', last_name: 'Nguyen', email_address: 'arannon@jumpstartlab.com', homephone: '6154385000', street: '3155 19th St NW', city: 'Washington', state: 'DC', zipcode: '20010' },
      { regdate: '11/12/08 10:47', first_name: 'Allison', last_name: 'Nguyen', email_address: 'arannon@jumpstartlab.com', homephone: '6154385000', street: '3155 19th St NW', city: 'Washington', state: 'DC', zipcode: '20010' },
    ].map { |row| Entry.new(row) }
    repository = Repository.new(entries)
    entries = repository.find_by('state', 'DC').sort_by(&:state)
    assert_equal 2, repository.results_count
  end
end
