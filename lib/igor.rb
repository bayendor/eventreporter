require 'csv'
require_relative 'entry'

class Igor
  attr_reader :entries

  def initialize(entries)
    @entries = entries
  end

  def self.load_entries(directory)
    file = File.join(directory, 'event_attendees.csv')
    data = CSV.open(file, headers: true, header_converters: :symbol)
    rows = data.collect { |row| Entry.new(row) }
    new(rows)
  end

  def find_by_last_name(name)
    entries.select { |entry| entry.last_name == name }
  end

  def find_by_zipcode(zipcode)
    entries.select { |entry| entry.zipcode == zipcode }
  end

  def find_by_state(state)
    entries.select { |entry| entry.state == state }
  end

  #do we just repeat these for all the options involved? first & last name, address, state, etc...

end
