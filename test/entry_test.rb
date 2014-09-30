gem 'minitest', '~> 5.4'    # => true
require 'minitest/autorun'  # => true

require_relative '../lib/entry'  # => true

class EntryTest < MiniTest::Test
  def test_entry_attributes
    data = {
      RegDate: '11/12/08 10:47',                          # => "11/12/08 10:47"
      first_Name: 'Allison',                              # => "Allison"
      last_Name: 'Nguyen',                                # => "Nguyen"
      Email_Address: 'arannon@jumpstartlab.com',          # => "arannon@jumpstartlab.com"
      HomePhone: '6154385000',Street: '3155 19th St NW',  # => "3155 19th St NW"
      City: 'Washington',                                 # => "Washington"
      State: 'DC',                                        # => "DC"
      Zipcode: '20010'                                    # => "20010"
    }                                                     # => {:RegDate=>"11/12/08 10:47", :first_Name=>"Allison", :last_Name=>"Nguyen", :Email_Address=>"arannon@jumpstartlab.com", :HomePhone=>"6154385000", :Street=>"3155 19th St NW", :City=>"Washington", :State=>"DC", :Zipcode=>"20010"}

    entry = Entry.new(data)  # => #<Entry:0x007f9eb486a420 @regdate="11/12/08 10:47", @first_name="Allison", @last_name="Nguyen", @email_address="arannon@jumpstartlab.com", @phone_number="6154385000", @street="3155 19th St NW", @city="Washington", @state="DC", @zipcode="20010">

    assert_equal 'Allison', entry.first_name       # => true
    assert_equal 'Nguyen', entry.last_name         # => true
    assert_equal 'Allison Nguyen', entry.name      # => true
    assert_equal '6154385000', entry.phone_number  # => true
  end
end

# >> Run options: --seed 64580
# >>
# >> # Running:
# >>
# >> .
# >>
# >> Finished in 0.001040s, 961.5385 runs/s, 3846.1538 assertions/s.
# >>
# >> 1 runs, 4 assertions, 0 failures, 0 errors, 0 skips
