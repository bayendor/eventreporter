gem 'minitest', '~> 5.4'
require 'minitest/autorun'

require_relative '../lib/repository'

class RepositoryTest < Minitest::Test
  def test_retrieve_by_last_name
    entries = [
      { RegDate: '11/12/08 10:47', first_Name: 'Allison', last_Name: 'Nguyen', Email_Address: 'arannon@jumpstartlab.com',HomePhone: '6154385000',Street: '3155 19th St NW',City: 'Washington',State: 'DC',Zipcode: '20010' },
      { RegDate: '11/12/08 10:47', first_Name: 'Allison', last_Name: 'Nguyen', Email_Address: 'arannon@jumpstartlab.com',HomePhone: '6154385000',Street: '3155 19th St NW',City: 'Washington',State: 'DC',Zipcode: '20010' }
    ].map { |row| Entry.new(row) }

    repository = Repository.new(entries)
    entries = repository.find_by_last_name("Nguyen").sort_by { |e| e.last_name }
    assert_equal 2, entries.length
  end

  def test_retrieve_by_zipcode
    entries = [
      { RegDate: '11/12/08 10:47', first_Name: 'Allison', last_Name: 'Nguyen', Email_Address: 'arannon@jumpstartlab.com',HomePhone: '6154385000',Street: '3155 19th St NW',City: 'Washington',State: 'DC',Zipcode: '20010' },
      { RegDate: '11/12/08 10:47', first_Name: 'Allison', last_Name: 'Nguyen', Email_Address: 'arannon@jumpstartlab.com',HomePhone: '6154385000',Street: '3155 19th St NW',City: 'Washington',State: 'DC',Zipcode: '20010' }
    ].map { |row| Entry.new(row) }

    repository = Repository.new(entries)
    entries = repository.find_by_zipcode("20010").sort_by { |e| e.zipcode }
    assert_equal 2, entries.count
  end

  def test_retrieve_by_state
    entries = [
      { RegDate: '11/12/08 10:47', first_Name: 'Allison', last_Name: 'Nguyen', Email_Address: 'arannon@jumpstartlab.com',HomePhone: '6154385000',Street: '3155 19th St NW',City: 'Washington',State: 'DC',Zipcode: '20010' },
      { RegDate: '11/12/08 10:47', first_Name: 'Allison', last_Name: 'Nguyen', Email_Address: 'arannon@jumpstartlab.com',HomePhone: '6154385000',Street: '3155 19th St NW',City: 'Washington',State: 'DC',Zipcode: '20010' }
    ].map { |row| Entry.new(row) }

    repository = Repository.new(entries)
    entries = repository.find_by_state("DC").sort_by { |e| e.state }
    assert_equal 2, entries.count
  end

  def test_case_insensitive_search
    entries = [
      { RegDate: '11/12/08 10:47', first_Name: 'Allison', last_Name: 'Nguyen', Email_Address: 'arannon@jumpstartlab.com',HomePhone: '6154385000',Street: '3155 19th St NW',City: 'Washington',State: 'DC',Zipcode: '20010' },
      { RegDate: '11/12/08 10:47', first_Name: 'Allison', last_Name: 'Nguyen', Email_Address: 'arannon@jumpstartlab.com',HomePhone: '6154385000',Street: '3155 19th St NW',City: 'Washington',State: 'DC',Zipcode: '20010' }
    ].map { |row| Entry.new(row) }

    repository = Repository.new(entries)
    entries = repository.find_by_last_name("nguyen").sort_by { |e| e.first_name }
    assert_equal 2, entries.count
  end
end
