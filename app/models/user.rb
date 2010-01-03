class User < SimpleRecord::Base

    has_strings :first_name, :last_name, :city, :state, :country, :zip, :sex, :is_cool
    has_ints :age


end
