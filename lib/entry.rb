class Entry
  attr_reader :regdate,
              :first_name,
              :last_name,
              :email_address,
              :phone_number,
              :street,
              :city,
              :state,
              :zipcode

  def initialize(data)
    @regdate = data[:RegDate]
    @first_name = data[:first_Name]
    @last_name = data[:last_Name]
    @email_address = data[:Email_Address]
    @phone_number = data[:HomePhone]
    @street = data[:Street]
    @city = data[:City]
    @state = data[:State]
    @zipcode = data[:Zipcode]
  end

  def name
    "#{first_name} #{last_name}"
  end

end
