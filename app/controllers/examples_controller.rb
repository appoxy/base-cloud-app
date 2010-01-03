class ExamplesController < ApplicationController


    # Here's an example of a simple Simple_Record call
    def simple_record
        # Let's create a new user object.  Notice this is all just like ActiveRecord
        @user = User.new(:first_name => "Chad", :last_name => "Arimura", :is_cool => "Sometimes!")

        # This saves the user into SimpleDB using Simple_Record.
        @user.save
    end


    # Here we use our cache store (presumably cloud cache)
    def cloud_cache
        # This stores the value in cloud cache
        CACHE.put("example_value_1", "This value is stored in Cloud Cache!")
        
        # Now let's grab the value out of cc.
        @example_value = CACHE.get("example_value_1")
    end


    # Here we setup a worker to process some code
    def simple_worker
        # TO BE FINISHED - JANUARY 2010
    end


    # Here we show an example of how to use simple_performr
    def simple_performr
        # TO BE FINISHED - FEBRUARY 2010
    end





    
end