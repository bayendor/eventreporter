require 'terminal-table'

class Printout
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
                result.email_address,
                result.zipcode,
                result.city,
                result.state,
                result.phone_number]
    end
  end
end
