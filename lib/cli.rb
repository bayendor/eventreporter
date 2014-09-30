require_relative 'message_printer'
require_relative 'event_reporter'

class CLI
  attr_reader :command, :printer

  def initialize(output_stream)
    @command = ""
    @printer = MessagePrinter.new(output_stream)
  end

  def start
    printer.intro
    until finished?
      printer.command_request
      @command = gets.strip
      process_initial_commands
    end
    printer.ending
  end

  private

  def process_initial_commands
    case
    when load?
      igor = Igor.new(printer)
      #need a new name for queue since you cannot have a queue class without breaking Ruby (says Herbert)
      igor.load
    when help?
      printer.igor_help
    else
      printer.not_a_valid_command
    end
  end

  def load?
    command == "l" || command == "load"
  end

  def help?
    command == "h" || command == "help"
  end

  def finished?
    command == "q" || command == "quit"
  end
end
