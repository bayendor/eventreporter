gem 'minitest', '~> 5.4'
require 'minitest/autorun'

require_relative '../lib/entry'

class EntryTest < MiniTest::Test
  def test_entry_attributes
    data = {
      RegDate: '11/12/08 10:47',
      first_Name: 'Allison',
      last_Name: 'Nguyen',
      Email_Address: 'arannon@jumpstartlab.com',
      HomePhone: '6154385000', Street: '3155 19th St NW',
      City: 'Washington',
      State: 'DC',
      Zipcode: '20010'
    }

    entry = Entry.new(data)

    assert_equal 'Allison', entry.first_name
    assert_equal 'Nguyen', entry.last_name
    assert_equal 'Allison Nguyen', entry.name
    assert_equal '6154385000', entry.phone_number
  end
end
