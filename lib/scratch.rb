string ="here is a string"

string.upcase

string.send(:upcase) # => "HERE IS A STRING"

attribute = "first_name"

value = "jean"



entries = %w( jean john alex david )

# entries.select { |entry| entry.send(attribute.to_sym) == value }
