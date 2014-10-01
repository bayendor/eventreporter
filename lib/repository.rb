require 'csv'
require_relative 'entry'

class Repository
  attr_reader :entries, :results

  def initialize(entries=[])
    @entries = entries
    @results = []
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

  end

  def results_print

  end
end
