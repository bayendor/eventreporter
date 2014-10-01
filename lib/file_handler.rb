require 'csv'
require_relative 'entry'

class FileHandler
  attr_reader :entries

  def initialize(directory='data/', file = 'event_test.csv')
    file = File.join(directory, file)
    data = CSV.open(file, headers: true, header_converters: :symbol)
    @entries = data.collect { |row| Entry.new(row) }
  end
end
