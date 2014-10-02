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

  def loaded(file)
    @output_stream.puts "#{file} is now loaded."
  end

  def file_not_found
    @output_stream.puts "File not found."
  end

  def results(count)
    @output_stream.puts "Your search returned #{count} results."
  end

  def results_clear
    @output_stream.puts "The queue has been cleared."
  end

  def results_count(count)
    @output_stream.puts "There are #{count} results in the queue."
  end

  def results_print
    @output_stream.puts "Your results:"
  end

  def help
    @output_stream.puts "Choose from the following help topics: find, load, queue, queue clear, queue count, queue print, save. You may type 'Help [topic]' at anytime."
  end

  def help_find
    @output_stream.puts ".....FIND: To use the find command, simply type 'FIND [category] [entry]'.
    Choose from the following categories: first_name, last_name, email_address, phone_number, street, city, state or zipcode.
    An entry would be information like Massachusetts or 63130.
    Ex. FIND FIRST_NAME IGOR would return all file listings that include gentlemen with the first name Igor."
  end

  def help_load
    @output_stream.puts ".....LOAD: To load a file, type 'LOAD [filename]'. Ex. LOAD EVENT_ATTENDEES.CSV"
  end

  def help_queue
    @output_stream.puts ".....QUEUE: So you need help with the queue, eh? Let's talk..."
  end

  def help_queue_clear
    @output_stream.puts ".....QUEUE CLEAR: Info about clearing the queue..."
  end

  def help_queue_count
    @output_stream.puts ".....QUEUE COUNT: Info about the queue count..."
  end

  def help_queue_print
    @output_stream.puts ".....QUEUE PRINT: Info about printing your queue..."
  end

  def help_save
    @output_stream.puts ".....SAVE: Info about saving..."
  end

  def ending
    @output_stream.puts "Thanks for using Event Reporter. Goodbye."
  end

  def not_a_valid_command_message
    @output_stream.puts "That's not a valid command. Please try again. You may ask for (h)elp at any time."
  end

  def specify_filename
    @output_stream.puts 'Please specify a filename.'
  end

end
