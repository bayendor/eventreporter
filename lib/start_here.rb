require_relative 'repository'

class StartHere

  attr_reader :repository

  def initialize(repository = Repository.load_entries('./data'))
    @repository = repository
  end
  #too much repository

  def lookup(name)
    if name.include?(',')
      repository.find_by_first_and_last_name(name)
    else
      repository.find_by_last_name(name)
    end
  end

  def reverse_lookup(number)
    repository.find_by_number(number)
  end

end
