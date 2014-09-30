gem 'minitest', '~> 5.4'    # => true
require 'minitest/autorun'  # => true

require_relative '../lib/igor'  # => true

class IgorTest < Minitest::Test
  def test_retrieve_by_last_name
    entries = [
      { RegDate: '11/12/08 10:47', first_Name: 'Allison', last_Name: 'Nguyen', Email_Address: 'arannon@jumpstartlab.com',HomePhone: '6154385000',Street: '3155 19th St NW',City: 'Washington',State: 'DC',Zipcode: '20010' },  # => {:RegDate=>"11/12/08 10:47", :first_Name=>"Allison", :last_Name=>"Nguyen", :Email_Address=>"arannon@jumpstartlab.com", :HomePhone=>"6154385000", :Street=>"3155 19th St NW", :City=>"Washington", :State=>"DC", :Zipcode=>"20010"}
      { RegDate: '11/12/08 10:47', first_Name: 'Allison', last_Name: 'Nguyen', Email_Address: 'arannon@jumpstartlab.com',HomePhone: '6154385000',Street: '3155 19th St NW',City: 'Washington',State: 'DC',Zipcode: '20010' }   # => {:RegDate=>"11/12/08 10:47", :first_Name=>"Allison", :last_Name=>"Nguyen", :Email_Address=>"arannon@jumpstartlab.com", :HomePhone=>"6154385000", :Street=>"3155 19th St NW", :City=>"Washington", :State=>"DC", :Zipcode=>"20010"}
    ].map { |row| Entry.new(row) }                                                                                                                                                                                             # => [#<Entry:0x007fa1f0820868 @regdate="11/12/08 10:47", @first_name="Allison", @last_name="Nguyen", @email_address="arannon@jumpstartlab.com", @phone_number="6154385000", @street="3155 19th St NW", @city="Washington", @state="DC", @zipcode="20010">, #<Entry:0x007fa1f0820840 @regdate="11/12/08 10:47", @first_name="Allison", @last_name="Nguyen", @email_address="arannon@jumpstartlab.com", @phone_number="6154385000", @street="3155 19th St NW", @city="Washington", @state="DC", @zipcode="20010">]

    repository = Igor.new(entries)                                                 # => #<Igor:0x007fa1f0820200 @entries=[#<Entry:0x007fa1f0820868 @regdate="11/12/08 10:47", @first_name="Allison", @last_name="Nguyen", @email_address="arannon@jumpstartlab.com", @phone_number="6154385000", @street="3155 19th St NW", @city="Washington", @state="DC", @zipcode="20010">, #<Entry:0x007fa1f0820840 @regdate="11/12/08 10:47", @first_name="Allison", @last_name="Nguyen", @email_address="arannon@jumpstartlab.com", @phone_number="6154385000", @street="3155 19th St NW", @city="Washington", @state="DC", @zipcode="20010">]>
    entries = repository.find_by_last_name("Nguyen").sort_by { |e| e.first_name }  # => [#<Entry:0x007fa1f0820868 @regdate="11/12/08 10:47", @first_name="Allison", @last_name="Nguyen", @email_address="arannon@jumpstartlab.com", @phone_number="6154385000", @street="3155 19th St NW", @city="Washington", @state="DC", @zipcode="20010">, #<Entry:0x007fa1f0820840 @regdate="11/12/08 10:47", @first_name="Allison", @last_name="Nguyen", @email_address="arannon@jumpstartlab.com", @phone_number="6154385000", @street="3155 19th St NW", @city="Washington", @state="DC", @zipcode="20010">]
    assert_equal 2, entries.length                                                 # => true
  end

  def test_retrieve_by_zipcode
    entries = [
      { RegDate: '11/12/08 10:47', first_Name: 'Allison', last_Name: 'Nguyen', Email_Address: 'arannon@jumpstartlab.com',HomePhone: '6154385000',Street: '3155 19th St NW',City: 'Washington',State: 'DC',Zipcode: '20010' },  # => {:RegDate=>"11/12/08 10:47", :first_Name=>"Allison", :last_Name=>"Nguyen", :Email_Address=>"arannon@jumpstartlab.com", :HomePhone=>"6154385000", :Street=>"3155 19th St NW", :City=>"Washington", :State=>"DC", :Zipcode=>"20010"}
      { RegDate: '11/12/08 10:47', first_Name: 'Allison', last_Name: 'Nguyen', Email_Address: 'arannon@jumpstartlab.com',HomePhone: '6154385000',Street: '3155 19th St NW',City: 'Washington',State: 'DC',Zipcode: '20010' }   # => {:RegDate=>"11/12/08 10:47", :first_Name=>"Allison", :last_Name=>"Nguyen", :Email_Address=>"arannon@jumpstartlab.com", :HomePhone=>"6154385000", :Street=>"3155 19th St NW", :City=>"Washington", :State=>"DC", :Zipcode=>"20010"}
    ].map { |row| Entry.new(row) }                                                                                                                                                                                             # => [#<Entry:0x007fa1f0830038 @regdate="11/12/08 10:47", @first_name="Allison", @last_name="Nguyen", @email_address="arannon@jumpstartlab.com", @phone_number="6154385000", @street="3155 19th St NW", @city="Washington", @state="DC", @zipcode="20010">, #<Entry:0x007fa1f0830010 @regdate="11/12/08 10:47", @first_name="Allison", @last_name="Nguyen", @email_address="arannon@jumpstartlab.com", @phone_number="6154385000", @street="3155 19th St NW", @city="Washington", @state="DC", @zipcode="20010">]

    repository = Igor.new(entries)                                           # => #<Igor:0x007fa1f082bc40 @entries=[#<Entry:0x007fa1f0830038 @regdate="11/12/08 10:47", @first_name="Allison", @last_name="Nguyen", @email_address="arannon@jumpstartlab.com", @phone_number="6154385000", @street="3155 19th St NW", @city="Washington", @state="DC", @zipcode="20010">, #<Entry:0x007fa1f0830010 @regdate="11/12/08 10:47", @first_name="Allison", @last_name="Nguyen", @email_address="arannon@jumpstartlab.com", @phone_number="6154385000", @street="3155 19th St NW", @city="Washington", @state="DC", @zipcode="20010">]>
    entries = repository.find_by_zipcode("20010").sort_by { |e| e.zipcode }  # => [#<Entry:0x007fa1f0830038 @regdate="11/12/08 10:47", @first_name="Allison", @last_name="Nguyen", @email_address="arannon@jumpstartlab.com", @phone_number="6154385000", @street="3155 19th St NW", @city="Washington", @state="DC", @zipcode="20010">, #<Entry:0x007fa1f0830010 @regdate="11/12/08 10:47", @first_name="Allison", @last_name="Nguyen", @email_address="arannon@jumpstartlab.com", @phone_number="6154385000", @street="3155 19th St NW", @city="Washington", @state="DC", @zipcode="20010">]
    assert_equal 2, entries.count                                            # => true
  end

  def test_retrieve_by_state
    entries = [
      { RegDate: '11/12/08 10:47', first_Name: 'Allison', last_Name: 'Nguyen', Email_Address: 'arannon@jumpstartlab.com',HomePhone: '6154385000',Street: '3155 19th St NW',City: 'Washington',State: 'DC',Zipcode: '20010' },  # => {:RegDate=>"11/12/08 10:47", :first_Name=>"Allison", :last_Name=>"Nguyen", :Email_Address=>"arannon@jumpstartlab.com", :HomePhone=>"6154385000", :Street=>"3155 19th St NW", :City=>"Washington", :State=>"DC", :Zipcode=>"20010"}
      { RegDate: '11/12/08 10:47', first_Name: 'Allison', last_Name: 'Nguyen', Email_Address: 'arannon@jumpstartlab.com',HomePhone: '6154385000',Street: '3155 19th St NW',City: 'Washington',State: 'DC',Zipcode: '20010' }   # => {:RegDate=>"11/12/08 10:47", :first_Name=>"Allison", :last_Name=>"Nguyen", :Email_Address=>"arannon@jumpstartlab.com", :HomePhone=>"6154385000", :Street=>"3155 19th St NW", :City=>"Washington", :State=>"DC", :Zipcode=>"20010"}
    ].map { |row| Entry.new(row) }                                                                                                                                                                                             # => [#<Entry:0x007fa1f0828fb8 @regdate="11/12/08 10:47", @first_name="Allison", @last_name="Nguyen", @email_address="arannon@jumpstartlab.com", @phone_number="6154385000", @street="3155 19th St NW", @city="Washington", @state="DC", @zipcode="20010">, #<Entry:0x007fa1f0828f68 @regdate="11/12/08 10:47", @first_name="Allison", @last_name="Nguyen", @email_address="arannon@jumpstartlab.com", @phone_number="6154385000", @street="3155 19th St NW", @city="Washington", @state="DC", @zipcode="20010">]

    repository = Igor.new(entries)                                    # => #<Igor:0x007fa1f0828a18 @entries=[#<Entry:0x007fa1f0828fb8 @regdate="11/12/08 10:47", @first_name="Allison", @last_name="Nguyen", @email_address="arannon@jumpstartlab.com", @phone_number="6154385000", @street="3155 19th St NW", @city="Washington", @state="DC", @zipcode="20010">, #<Entry:0x007fa1f0828f68 @regdate="11/12/08 10:47", @first_name="Allison", @last_name="Nguyen", @email_address="arannon@jumpstartlab.com", @phone_number="6154385000", @street="3155 19th St NW", @city="Washington", @state="DC", @zipcode="20010">]>
    entries = repository.find_by_state("DC").sort_by { |e| e.state }  # => [#<Entry:0x007fa1f0828fb8 @regdate="11/12/08 10:47", @first_name="Allison", @last_name="Nguyen", @email_address="arannon@jumpstartlab.com", @phone_number="6154385000", @street="3155 19th St NW", @city="Washington", @state="DC", @zipcode="20010">, #<Entry:0x007fa1f0828f68 @regdate="11/12/08 10:47", @first_name="Allison", @last_name="Nguyen", @email_address="arannon@jumpstartlab.com", @phone_number="6154385000", @street="3155 19th St NW", @city="Washington", @state="DC", @zipcode="20010">]
    assert_equal 2, entries.count                                     # => true
  end
end

# >> Run options: --seed 53039
# >>
# >> # Running:
# >>
# >> ...
# >>
# >> Finished in 0.001591s, 1885.6065 runs/s, 1885.6065 assertions/s.
# >>
# >> 3 runs, 3 assertions, 0 failures, 0 errors, 0 skips
