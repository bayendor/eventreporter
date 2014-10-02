require 'terminal-table'

rows = []
rows << ['One', 1]
rows << ['Two', 2]
rows << ['Three', 3]
table = Terminal::Table.new rows: rows

puts table
#
# +-------+---+
# | One   | 1 |
# | Two   | 2 |
# | Three | 3 |
# +-------+---+

# File Load Logic

def load_file(file = 'event_attendees.csv')
  if File.exist?("./data/#{file}")
    data = FileHandler.new(file)
    @repository = Repository.new(data.entries)
    printer.loaded
  else
    printer.file_not_found
  end
end
