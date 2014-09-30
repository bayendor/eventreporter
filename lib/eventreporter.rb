#!/usr/bin/env ruby

Dir['./lib/*.rb'].each { |file| require file }

# CLI.new.start

class EventReporter
  attr_reader :repository

  def initialize(repository = Repository.load_entries('./data'))
    @repository = repository
  end
end
