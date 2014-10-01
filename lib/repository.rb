require 'csv'
require_relative 'entry'

class Repository
  attr_reader :entries, :results

  def self.load_entries(directory, file = 'event_test.csv')
    file = File.join(directory, file)
    data = CSV.open(file, headers: true, header_converters: :symbol)
    rows = data.collect { |row| Entry.new(row) }
    new(rows)
  end

  def initialize(entries)
    @entries = entries
    @results = []
  end

  def find_by_last_name(name)
    @results = entries.select { |entry| entry.last_name.downcase == name.downcase }
  end

  def find_by_first_name(name)
    @results = entries.select { |entry| entry.first_name.downcase == name.downcase }
  end

  def find_by_zipcode(zipcode)
    @results = entries.select { |entry| entry.zipcode == zipcode }
  end

  def find_by_state(state)
    @results = entries.select { |entry| entry.state == state }
  end

  def find_count
    @results.count
  end

  def clear
    @results = []
  end
end
