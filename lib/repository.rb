require_relative 'file_handler'

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
    @results.sort_by { |result| result.send(criteria.to_sym) }
  end

  def results_print
    printout = Printout.new(results)
    printout.create_printout
  end

  def print_results
    results.each do |result|
      @rows << [result.first_name,
                result.last_name,
                result.email_address,
                result.zipcode,
                result.city,
                result.state,
                result.phone_number]
    end
  end
end
