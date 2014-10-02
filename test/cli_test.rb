require_relative 'test_helper'

require_relative '../lib/cli'
require 'stringio'

class CliTest < Minitest::Test
  def test_happy_path
    output_stream = StringIO.new
    cli = CLI.new(output_stream)

    # load event_attendees.csv
    # cli.process_command "load event_attendees.csv"

    # queue count should return 0
    # find first_name John
    # queue count should return 63
    # queue clear
    # queue count should return 0

    # help should list the commands
    skip
    refute_includes output_stream.string, 'help'
    cli.process_command 'help'
    assert_includes output_stream.string, 'help'

    # help queue count should explain the queue count function
    refute_includes output_stream.string, 'help queue count'
    cli.process_command 'help queue count'
    assert_includes output_stream.string, 'queue count'

    # help queue count should explain the queue print function
    refute_includes output_stream.string, 'help queue print'
    cli.process_command 'help queue count'
    assert_includes output_stream.string, 'queue print'
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
