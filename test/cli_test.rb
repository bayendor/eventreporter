require_relative 'test_helper'
require_relative '../lib/cli'
require_relative '../lib/message_printer'

class CliTest < Minitest::Test
  def test_happy_path

    # load event_attendees.csv
    handler = FileHandler.new('event_attendees.csv')
    entries = handler.entries
    repo = Repository.new(entries)
    # queue count should return 0
    assert_equal 0, repo.results_count

    # find first_name John
    repo.find_by('first_name', 'John').sort_by { |e| e.last_name }
    assert_equal 62, repo.results_count
    # queue count should return 62
    assert_equal 62, repo.results_count
    # queue clear
    repo.results_clear
    assert_equal 0, repo.results_count
    # queue count should return 0
    assert_equal 0, repo.results_count

    # help should list the commands
    # help queue count should explain the queue count function
    # help queue count should explain the queue print function

  end

  def test_printing
    skip
    # load
    # queue count should return 0
    # find first_name John
    # find first_name Mary
    # queue print should print out the 16 attendees
    # queue print by last_name should print the same attendees sorted alphabetically by last name
    # queue count should return 16
  end

  def test_saving
    skip
    # load
    # find city Salt Lake City
    # queue print should display 13 attendees
    # queue save to city_sample.csv
    # Open the CSV and inspect that it has correct headers and the data rows from step 3.
    # find state DC
    # queue print by last_name should print them alphabetically by last name
    # queue save to state_sample.csv
    # Open the CSV and inspect that it has the headers, the data from step 7, but not the data previously found in step 2.
  end

  def test_reading_data
    skip
    # load
    # find state MD
    # queue save to state_sample.csv
    # quit
    # Restart the program and continue…
    # load state_sample.csv
    # find first_name John
    # queue count should return 4
  end

  def test_emptiness
    skip
    # Note that this set intentionally has no call to load:
    # find last_name Johnson
    # queue count should return 0
    # queue print should not print any attendee data
    # queue clear should not return an error
    # queue print by last_name should not print any data
    # queue save to empty.csv should output a file with only headers
    # queue count should return 0
  end
end
