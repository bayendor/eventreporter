require 'terminal-table'

class PrintOut
  attr_reader :results

  def initialize(results)
    @results = results
    @header = %w(LAST_NAME FIRST_NAME EMAIL ZIPCODE CITY ST ADDRESS PHONE)
    @rows = []
    print_results
  end

  def create_printout
    table = Terminal::Table.new headings: @header, rows: @rows
  end

  def print_results
    results.each do |result|
      @rows << [result.first_name,
                result.last_name,
                result.email,
                result.zipcode,
                result.city,
                result.state,
                result.homephone]
    end
  end
end
