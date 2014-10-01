require_relative 'message_printer'
require_relative 'repository'

class CLI
  attr_reader :command, :printer, :repository, :input

  def initialize(output_stream)
    # @command = ""
    @printer = MessagePrinter.new(output_stream)
  #  @repository = Repository.new
  end

  def start
    printer.intro
    until finished?
      printer.command_request
      # @command = gets.strip.downcase
      process_command(gets)
    end
    printer.ending
  end

  def process_command(input)
    @input = input.strip.downcase.split(" ")
    @command = @input[0]
    case
    when load?
      @repository = Repository.load_entries('./data')
      # printer.loaded_entries(repository.entries.count)
      printer.loaded
    when help?
      printer.help
      #this always prints the initial help message - I think that's ok.
      help_additional_options
    else
      printer.not_a_valid_command
      #this isn't working... why?
    end
  end

  private

  def help_additional_options
    case
    when help_find?
       printer.help_find
    when help_load?
     printer.help_load
    when help_queue?
     printer.help_queue
    when help_queue_clear?
      printer.help_queue_clear
    when help_queue_count?
     printer.help_queue_count
    when help_queue_print?
      printer.help_queue_print
    when help_save?
      printer.help_save
    end
  end
  #refactor

  def load?
    command == "l" || command == "load"
  end

  def help?
    command == "h" || command == "help"
  end

  def help_find?
    @input == ["help", "find"]
  end

  def help_load?
    @input == ["help", "load"]
  end

  def help_queue?
    @input == ["help", "queue"]
  end

  def help_queue_clear?
    @input == ["help", "queue", "clear"]
  end

  def help_queue_count?
    @input == ["help", "queue", "count"]
  end

  def help_queue_print?
    @input == ["help", "queue", "print"]
  end

  def help_save?
    @input == ["help", "save"]
  end

  def finished?
    command == "q" || command == "quit"
  end

end
