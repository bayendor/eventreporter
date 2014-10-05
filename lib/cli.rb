require_relative 'message_printer'
require_relative 'repository'
require_relative 'file_handler'

class CLI
  attr_reader :command, :printer, :repository, :input, :file

  def initialize(output_stream)
    @file = FileHandler.new
    @printer = MessagePrinter.new(output_stream)
    @repository = Repository.new(file.entries)
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
    @input = gets.strip.split(' ')
    @command = @input[0].downcase
    case
    when load?
      if @input.length > 1
        load_file(@input[1])
      else
        load_file
      end
    when queue_count
      printer.results_count(@repository.results_count)
    when queue_clear
      @repository.results_clear
      printer.results_clear
    when queue_print
      printer.results_print
      @repository.print_results
    when help?
      printer.help
      help_additional_options
    when save
      if @input.length > 1
        FileHandler.new.save_file(repository.results, @input.last)
      else
        printer.specify_filename
      end
    when find
      if @input.length > 2
        value = input[2..input.length].join(' ')
        @repository.find_by(@input[1], value)
        printer.results(@repository.results_count)
      else
        printer.not_a_valid_command
      end
    when queue_sort
      if @input.length > 2
        @repository.results_sort(@input.last)
      else
        printer.not_a_valid_command
      end
    else
      not_a_valid_command
    end
  end

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

  def load?
    command == 'l' || command == 'load'
  end

  def load_file(file = 'event_attendees.csv')
    if File.exist?("./data/#{file}")
      data = FileHandler.new(file)
      @repository = Repository.new(data.entries)
      printer.loaded(file)
    else
      printer.file_not_found
    end
  end

  def queue_clear
    @input == %w(queue clear)
  end

  def queue_count
    @input == %w(queue count)
  end

  def queue_print
    @input == %w(queue print)
  end

  def help?
    command == 'h' || command == 'help'
  end

  def help_find?
    @input == %w(help find)
  end

  def help_load?
    @input == %w(help load)
  end

  def help_queue?
    @input == %w(help queue)
  end

  def help_queue_clear?
    @input == %w(help queue clear)
  end

  def help_queue_count?
    @input == %w(help queue count)
  end

  def help_queue_print?
    @input == %w(help queue print)
  end

  def help_save?
    @input == %w(help save)
  end

  def not_a_valid_command
    if finished?
      printer.ending
      exit
    else
      printer.not_a_valid_command_message
    end
  end

  def save
    command == 'save'
  end

  def finished?
    command == 'q' || command == 'quit'
  end

  def save
    command == 'save'
  end

  def find
    command == 'find'
  end

  def queue_sort
    @input[1] == 'print' && @input[2] == 'by'
  end
end
