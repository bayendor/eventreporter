require './lib/repository'
#?
class MessagePrinter
  def initialize(output_stream)
    @output_stream = output_stream
  end

  def intro
    @output_stream.puts "Welcome to Event Reporter."
    program_instructions
  end

  def program_instructions
    @output_stream.puts "Would you like to (l)oad a file, ask for (h)elp, or (q)uit?"
  end

  def command_request
    print "Enter your command: "
  end

  def igor_help
    @output_stream.puts "Intro to basic help... Will be expanded later. Ex. Search [help] [topic]..."
  end

  def ending
    @output_stream.puts "Goodbye."
  end

  def igor_intro
    @output_stream.puts "Use Entry Reporter to do blah blah blah..."
  end

  def igor_quit
    @output_stream.puts "Exiting queue."
    program_instructions
  end

  def not_a_valid_command
    if command = "q" || "quit"
      @output_stream.puts "Thanks for using Event Manager."
      exit
    else
      @output_stream.puts "That's not a valid command."
    end
  end

end
