require 'csv'
require_relative 'entry'

class FileHandler
  attr_reader :entries

  def initialize(file = 'event_attendees.csv')
    file = File.join('data/', file)
    data = CSV.open(file, headers: true, header_converters: :symbol)
    @entries = data.collect { |row| Entry.new(row) }
  end

  def save_file(results, file)
    CSV.open("data/#{file}", 'w') do |csv|
      column_names = %w( regdate first_name last_name email_address phone_number street city state zipcode )
      csv << column_names
      results.each do |result|
        # csv << results.values_at(*column_names)
        csv << [ result.regdate, result.first_name,
                 result.last_name, result.email_address, result.phone_number,
                 result.street, result.city, result.state, result.zipcode ]
      end
    end
  end
end
