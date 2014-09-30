require './lib/repository'
#?
class MessagePrinter
  def intro
    puts "Welcome to Event Reporter."
    program_instructions
  end

  def program_instructions
    puts "Would you like to (l)oad a file, ask for (h)elp, or (q)uit?"
  end

  def command_request
    print "Enter your command: "
  end

  def igor_help
    puts "Intro to basic help... Will be expanded later. Ex. Search [help] [topic]..."
  end

  def ending
    puts "Goodbye."
  end

  def igor_intro
    puts "Use Entry Reporter to do blah blah blah..."
  end

  def igor_quit
    puts "Exiting queue."
    program_instructions
  end

  def not_a_valid_command
    if command = "q" || "quit"
      puts "Thanks for using Event Manager."
      exit
    else
    puts "That's not a valid command."
    end
  end

end
