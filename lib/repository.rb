require_relative 'file_handler'
require 'table_print'

class Repository
  attr_reader :entries, :results, :rows

  def initialize(entries = [])
    @entries = entries
    @results = []
    @rows = []
  end

  def find_by(criteria, value)
    @results = entries.find_all { |entry| entry.send(criteria.to_sym) == value }
  end

  def results_count
    @results.count
  end

  def results_clear
    @results = []
  end

  def results_sort(criteria)
    @results.sort! { |a, b| a.send(criteria.to_sym) <=> b.send(criteria.to_sym) }
  end

  def results_print
    printout = Printout.new(results)
    printout.create_printout
  end

  def print_results
      tp @results
  end
end
