require_relative 'message_printer'
require_relative 'repository'
require_relative 'file_handler'

class CLI
  attr_reader :command, :printer, :repository, :input, :file

  def initialize(output_stream)
    @file = FileHandler.new
    entries = file.entries
    @printer = MessagePrinter.new(output_stream)
    @repository = Repository.new(entries)
  end

  def start
    printer.intro
    until finished?
      printer.command_request
      process_command
    end
    printer.ending
  end

  def process_command
    @input = gets.strip.downcase.split(" ")
    @command = @input[0]
    case
    when load?
      if @input.length > 1
        load_file(@input[1])
      else
        load_file
      end
    when queue_count
      count = @repository.results_count
      printer.results_count(count)
    when queue_clear
      @repository.results_clear
      printer.results_clear
    when queue_print
      @repository.results_print
      printer.results_print
    when help?
      printer.help
      help_additional_options
    when save
      if @input.length > 1
        FileHandler.new.save_file(repository.results, @input.last)
      else
        printer.specify_filename
      end
    else
      not_a_valid_command
    end
  end

#  private

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

  def load_file(file="event_attendees.csv")
    if File.exist?("./data/#{file}")
      data = FileHandler.new(file)
      @repository = Repository.new(data.entries)
      printer.loaded(file)
    else
      printer.file_not_found
    end
  end

  def queue_clear
    @input == ["queue", "clear"]
  end

  def queue_count
    @input == ["queue", "count"]
  end

  # def queue_sort
  #   @input == ["queue", "sort"]
  #   #when is this used?
  # end

  def queue_print
    @input == ["queue", "print"]
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

  def not_a_valid_command
    if command == "q" || command == "quit"
      printer.ending
      exit
    else
      printer.not_a_valid_command_message
    end
  end

  def finished?
    command == "q" || command == "quit"
  end

  def save
    command == 'save'
  end

end
