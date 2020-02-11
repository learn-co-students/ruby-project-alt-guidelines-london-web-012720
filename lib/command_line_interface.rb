class CommandLineInterface 


    def greet 

        puts "------------------------------------------------------"

        puts "Welcome my friend"

        puts "------------------------------------------------------"
    end

    def menu 
       
        puts "------------------------------------------------------"

        puts "Please enter your name"
        #create instance variable to be able to use it in other methods
        @user_input = gets.chomp
        @response = User.find_by(user_name: @user_input)

        
        puts "------------------------------------------------------"

        if @response
            mainscreen
        else
            puts "Try again"
            menu 
        
        end

    end

    def mainscreen
        puts "Welcome back #{@user_input}."
        puts "
        1. Orders history
        2. Create a new order
        3. Go back to the login page
        "

        mainscreen_options = gets.chomp.to_i
        if mainscreen_options == 1 
            puts "Orders history"
            menu
        elsif mainscreen_options == 2 
            puts "Create a new order"
            insert_budget
        elsif mainscreen_options == 3 
            menu
        else
            puts "Insert valid option please."
            menu
        end

    end


    def insert_budget

        puts "------------------------------------------------------"

        puts "Please insert your budget #{@user_input}"
        @budget = gets.chomp.to_i
        puts "Your budget is #{@budget}"

        puts "------------------------------------------------------"
        list_of_tech
    end

    # LIST OF VARIABLE FOR PRODUCTS   

    


    def list_of_tech # Here we need to iterate through all items to match @budget and item_rice and show only the ones available
        puts "------------------------------------------------------"

        puts "Here we show all the items available with the budget depending on price."

        puts "Choose your technology to create an order. Then you will be returned to the main menu.
        1. Smart TV.
        2. Wireless speaker systems.
        3. Thermostats.
        4. Home security.
        5. Domestic.
        6. Smoke/CO.
        7. Lighting.
        8. Door.
        9. Laundry machines.
        10. Water detectors.
        11. Monitoring systems.
        "

        puts "------------------------------------------------------"

        @product_choosen = gets.chomp.to_i
        if @product_choosen == 1 

            Order.create(user_id: self.id, product_id: p1.id, date: 2020)
            binding.pry
            mainscreen
        elsif @product_choosen == 2 
            puts "num 2"
        elsif @product_choosen == 3 
            puts "num 3"
        elsif @product_choosen == 4 
            puts "num 4"
        elsif @product_choosen == 5 
            puts "num 5"
        elsif @product_choosen == 6 
            puts "num 6"
        elsif @product_choosen == 7 
            puts "num 7"
        elsif @product_choosen == 8 
            puts "num 8"
        elsif @product_choosen == 9 
            puts "num 9"
        elsif @product_choosen == 10 
            puts "num 10"
        elsif @product_choosen == 11 
            puts "num 11"
        else @product_choosen < 1 || @product_choosen > 11 
            puts "Please insert a valid option"
            list_of_tech
        end

        
    end

end