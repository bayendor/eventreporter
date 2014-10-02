require 'csv'
require_relative 'entry'

class FileHandler
  attr_reader :entries

  def initialize(file = 'event_attendees.csv')
    file = File.join('data/', file)
    data = CSV.open(file, headers: true, header_converters: :symbol)
    @entries = data.collect { |row| Entry.new(row) }
  end
end
