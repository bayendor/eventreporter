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
    refute_includes output_stream.string, "help"
    cli.process_command "help"
    assert_includes output_stream.string, "help"

    # help queue count should explain the queue count function
    # help queue print should explain the printing function
  end
end
