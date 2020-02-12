class CommandLineInterface

    def greet
        puts "________________"
        puts "Welcome to Tech Hunter"
        puts "________________"
    end

    def menu
        puts "________________"
        puts "Insert the user name to continue:"
        @user_name  = gets.chomp
        @user_instance = User.find_by(user_name: @user_name)
        puts "________________"
        if  @user_instance
            mainscreen
        else
             create_username 
        end
    end   

    def mainscreen
        puts "____________________________________________"
        puts "Welcome back #{@user_name}"
        puts "____________________________________________"
        puts "
        Where would you like to go?
        1. Order history
        2. Create a new order
        3. Update your order 
        4. Cancel your order
        5. Go back to the login page
        "
        puts "____________________________________________"
        
        mainscreen_options = gets.chomp.to_i
        if   mainscreen_options == 1
            order_history       
        elsif mainscreen_options == 2
            insert_budget
        elsif mainscreen_options == 3
            puts "num3"
            menu
        elsif mainscreen_options == 4
            puts "num4"
            menu
        elsif mainscreen_options == 5
            menu
        else
            puts "Insert valid option please try again."
            menu
        end
    end

    def create_username
        puts "____________________________________________"

        puts "Your name is not registered, please insert nickname to create a new user:"
        
        @user_name = gets.chomp.to_s


        puts "____________________________________________"

        @user_instance = User.create(user_name: "#{@user_name}")

        mainscreen
    end

    def order_history
        @u1  = User.find_by(user_name: @user_name)
             @@all_products = @u1.products
             @@all_products.map do |p|
             puts "You have ordered a #{p.product_type}, for £#{p.product_price}."
             puts""
         end
    end

    def insert_budget
        puts "insert budget"
        puts "__________________________________________ "
        user_budget = gets.chomp.to_i
            @product_budget = Product.all.select {|p|p.product_price <= user_budget}
        puts "Yout budget allow you to buy:"
            puts "____________________________________________"
            @product_budget.each_with_index do |p, i|
        puts "#{i +=1}\t #{p.product_type}, which cost #{p.product_price} product ID #{p.id}"
        puts ""
        end
        create_product 
    end

    def create_product
        puts "__________________________________________"
        puts"Select the ID of your chosen product"
        puts""
        user_choice = gets.chomp.to_i
        p = Product.find_by(id: user_choice)#return instance of the product 
         new_order =  Order.new(user_id: @user_instance.id, product_id: p.id, date: 2020).save
         puts""
        puts "You have bought selected #{p.product_type} which cost #{p.product_price}"
        puts ""
        puts "__________________________________________"
        mainscreen
    end


        def update_user_product 

            puts "---------------------------------------------------------------------------------"

            puts "Please enter your order to update" #I need to know order number?

            puts"
            
            
            "
            product_input = gets.chomp

            puts "---------------------------------------------------------------------------------"

            user = Order.find_by(order_id: product_id)

            puts "---------------------------------------------------------------------------------"

            puts "Please enter your new product"

            new_product = gets.chomp

            puts "---------------------------------------------------------------------------------"

            user.name = new_product

            order.save

            puts "---------------------------------------------------------------------------------"

            puts "You have now changed the product on your order to #{new_product}"

            puts "---------------------------------------------------------------------------------"

            maiscreen
    end
end



    def test
        @u1.products.each_with_index {|p, i|puts  "#{i} choose product to delete #{p.product_type}"}
    end






    #    @prodcuts.each {|p| Order.create(user_id: self.id, product_id: p.id, date: 2020)
#    def insert_budget
#        puts "------------------------------------------------------"
#        puts "Please insert your budget #{@user_input}"
#        @budget = gets.chomp.to_i
#        puts "Your budget is #{@budget}"
#        puts "------------------------------------------------------"
#        list_of_tech
#    end
#    # LIST OF VARIABLE FOR PRODUCTS
#    def list_of_tech # Here we need to iterate through all items to match @budget and item_price and show only the ones available
#        puts "------------------------------------------------------"
#        puts "------------------------------------------------------"
#        puts "Welcome to the catelogue!
#        1. Smart TV... £350
#            Connect this TV to your internet and stream to your hearts
#            content. Stream music and videos, browse the internet and view
#            photos... the world is your oyster!
#        2. Wireless speaker system... £649
#            This wireless speaker system includes speakers for up to 5 rooms,
#            these speakers can be paired and controlled from a mobile app
#            creating a cool vibe all around the house.
#        3. Thermostat... £75
#            This super thermostat automatically regulates temperature. It
#            can also be paired and controlled via a mobie app so you can turn
#            the heating up just in time for when you get home!
#        4. Home security system... £1099
#            Protect your home and your family with the security system.
#            This includes high decibel alarms, CCTV, motione detectors,
#            a control panel and more.
#        5. Domestic... £249
#            Forgot to feed your dog? Well that's not a problem with the
#            Domestic2000! Give your dog a little pick me up or a treat for
#            when you're missing him.
#        6. Smoke/CO detector... £15
#            Protect you and your family with this smoke and carbon monoxide
#            detector. This fire-protection device automatically detects and
#            gives warning when there is a presence of smoke.
#        7. Lighting... £89
#            The perfect modern chandelier to lilght up any room! Suitable for
#            most rooms and it absolutely stunning. You can transform a room in
#            seconds with this lighting.
#        8. Doors... £49
#            Made from quality solid oak, these doors are perfect for making
#            the room feel complete.
#        9. Laundry machine... £215
#            Powerful washing machine and tumble drier combination, perfect for
#            any busy household. Quick and reliable, your new best friend!
#        10. Water detector... £425
#            Detect the presence of water to provide an alert in time to prevent
#            a serious water leak.
#        11. Monitoring system... £199
#            The perfect start-up CCTV kit for any home. This budget item is great
#            if you just want that extra protection and monitoring whilst you're
#            away from your home."
#        puts "Choose a technology from the list to create an order:
#        1. Smart TV.
#        2. Wireless speaker systems.
#        3. Thermostats.
#        4. Home security.
#        5. Domestic.
#        6. Smoke/CO.
#        7. Lighting.
#        8. Door.
#        9. Laundry machines.
#        10. Water detectors.
#        11. Monitoring systems.
#        "
    #    puts "------------------------------------------------------"
    #    @product_choosen = gets.chomp.to_i
    #    if @product_choosen == 1
    #        Order.create(user_id: self.id, product_id: p1.id, date: 2020)
    #        binding.pry
    #        mainscreen
    #    elsif @product_choosen == 2
    #        puts "num 2"
    #    elsif @product_choosen == 3
    #        puts "num 3"
    #    elsif @product_choosen == 4
    #        puts "num 4"
    #    elsif @product_choosen == 5
    #        puts "num 5"
    #    elsif @product_choosen == 6
    #        puts "num 6"
    #    elsif @product_choosen == 7
    #        puts "num 7"
    #    elsif @product_choosen == 8
    #        puts "num 8"
    #    elsif @product_choosen == 9
    #        puts "num 9"
    #    elsif @product_choosen == 10
    #        puts "num 10"
    #    elsif @product_choosen == 11
    #        puts "num 11"
    #    else @product_choosen < 1 || @product_choosen > 11
    #        puts "Please insert a valid option"
    #        list_of_tech
    #    end
#    end
