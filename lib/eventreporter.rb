#!/usr/bin/env ruby

Dir['./lib/*.rb'].each { |file| require file }

# CLI.new.start

class EventReporter
  attr_reader :repository

  def initialize(repository = Repository.load_entries('./data'))
    @repository = repository
  end


  def lookup(name)
    lastname, firstname = name.split(', ')
    if firstname
      repository.find_by_first_and_last_name(firstname, lastname)
    else
      repository.find_by_last_name(name)
    end
  end

  def zip_code_lookup(zipcode)
    repository.find_by_zipcode(zipcode)
  end

end
