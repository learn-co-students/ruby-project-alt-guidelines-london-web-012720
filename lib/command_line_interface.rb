class CommandLineInterface

    def greet
        puts "________________"
        puts "Welcome to Tech Hunter"
        puts "________________"
    end

    def menu
        puts "________________"
        puts "Insert the user name to continue:"

        @user_name  = gets.chomp.to_s


        @user_instance = User.find_by(user_name: @user_name)
      
     
        puts "________________"
        if  @user_instance 

            mainscreen

        else
            create_username 
          
        end
    end   

      


    def mainscreen

        @all_orders    = @user_instance.orders
        @all_products  = @user_instance.products
        

        puts "____________________________________________"
        puts "Welcome back #{@user_name}"
        puts "____________________________________________"
        puts "
        What would you like to do?

        1. Order history
        2. Create a new order
        3. Update your order 
        4. Cancel your order
        5. Catalogue
        6. Go back to the login page
        7. Exit application
        "
        puts "____________________________________________"
        
        mainscreen_options = gets.chomp.to_i

        if  mainscreen_options == 1
            order_history       

        elsif mainscreen_options == 2
            list_option
        elsif mainscreen_options == 3
            update_order
        elsif mainscreen_options == 4
            delete_user_order
        elsif mainscreen_options == 5
            list_of_tech
        elsif mainscreen_options == 6

            menu
        elsif mainscreen_options == 7
            exit
        else
            puts "Insert valid option please try again."
            mainscreen
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

        
        puts "____________________________________________"
        if @all_orders.size <= 0 
            puts "Your order list is empty."
            puts "Press any key to go back to main menu."
        else
            
             #@all_products = @user_instance.products
             @all_orders.map do |p|
                # @deleted_item.destroy.save
                puts "You have ordered a #{p.product.product_type}, for £#{p.product.product_price}."
                puts""
                
                
            end
        end
        puts "____________________________________________"
        puts "Press any key to go back to main menu."
        order_sent_back = gets.chomp
        if order_sent_back
         mainscreen
        end

    end

    def list_option
        
        puts "__________________________________________ "
        puts "Press 1 to see our catalogue or 2 to insert budget:"
        list = gets.chomp.to_i
            if list == 1 
                list_of_tech
            elsif list == 2 
                return insert_budget
            else 
                puts "Enter a valid option please."
                list_option
            end
            
    end
            
    def insert_budget
        puts "Insert budget:"
        puts "__________________________________________ "

        user_budget = gets.chomp.to_i
        if user_budget > 0 
            @product_budget = Product.all.select {|p|p.product_price <= user_budget}
                puts "Yout budget allow you to buy:"
                puts "____________________________________________"
            @product_budget.each_with_index do |p, i|
                puts "#{i +=1}\t #{p.product_type}, which cost #{p.product_price} product ID #{p.id}"
                puts ""
            end
        else 
                puts "Insert correct amount, please:"
                insert_budget
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
         #@all_orders << new_order
         #binding.pry
         puts""
        puts "You have selected #{p.product_type} which cost #{p.product_price}, your order 
        has been processed successfully"
        puts ""
        puts "__________________________________________"
        @all_orders.reload
        mainscreen 
    end



    def update_order

        if @all_orders.size <= 0
            puts "Your order list in empty! Have a look to our great catelogue!"
            mainscreen
        else
            puts "__________________________________________" 
            
            puts "Please enter your order ID to update:"

            puts "__________________________________________"

                    @all_orders.select do |o|
                        puts "In your card there is #{o.product.product_type} with a order id #{o.id}."
                end
        end 
            puts "__________________________________________" 

            puts "Please select ID of your order to modify:" 

            order_to_modify_id =  gets.chomp.to_i    #id of the order to modify  
          
            puts "__________________________________________" 
            puts "" 
            
            puts "Please select the product ID you would like to enjoy:"
            puts "__________________________________________"   
            
            Product.all.map { |pr| puts "#{pr.product_type} with the cost of #{pr.product_price}, with the ID #{pr.id}."}
          
            puts "__________________________________________"
            
            new_product_id = gets.chomp.to_i #product_id
           
            
            if Product.find_by(id: new_product_id)

                # @all_orders.find do |o|
                #     #o.id == modify_order.id
                #         modify_order.update product_id: new_product
                #     end
                puts "Is this working?"
                # @all_orders.find do |o|
                #     o.product_type 
                # update_order

            else
                puts "Please introduce a valid product, please."
                update_order
            end
                            
            @all_orders.reload

            #puts "It might work"
            puts "__________________________________________"

            order_history

            puts "__________________________________________"
        
    end



    def delete_user_order

        if @all_orders.size <= 0
            puts "Your order list in empty. Have a look to our great catelogue!"
            mainscreen
        else

        puts "____________________________________________"

        puts "Please enter your order to cancel:"
          
            @all_products.find do |p|
                @all_orders.each do |o|
                    puts "In your card there is #{p.product_type} with a order id #{o.id}"
                end
            end

        puts "____________________________________________"
        
        deleted_item = Order.all.find_by(id: gets.chomp.to_i)
        
        if deleted_item
            deleted_item.destroy
            @all_orders.reload
            puts "Your order has been successfully deleted."
            mainscreen
        else 
            puts "You dont have that item in your bag."
            order_history
        end
            
        puts "____________________________________________"
        end
            
    end
       

    def list_of_tech

        puts "__________________________________________"
       puts "__________________________________________"
       puts "Welcome to the catelogue!
       1. Smart TV... £200
           Connect this TV to your internet and stream to your hearts
           content. Stream music and videos, browse the internet and view
           photos... the world is your oyster!
       2. Wireless speaker system... £100
           This wireless speaker system includes speakers for up to 5 rooms,
           these speakers can be paired and controlled from a mobile app
           creating a cool vibe all around the house.
       3. Thermostat... £300
           This super thermostat automatically regulates temperature. It
           can also be paired and controlled via a mobie app so you can turn
           the heating up just in time for when you get home!
       4. Home security system... £400
           Protect your home and your family with the security system.
           This includes high decibel alarms, CCTV, motione detectors,
           a control panel and more.
       5. Domestic... £500
           Forgot to feed your dog? Well that's not a problem with the
           Domestic2000! Give your dog a little pick me up or a treat for
           when you're missing him.
       6. Smoke/CO detector... £800
           Protect you and your family with this smoke and carbon monoxide
           detector. This fire-protection device automatically detects and
           gives warning when there is a presence of smoke.
       7. Lighting... £300
           The perfect modern chandelier to lilght up any room! Suitable for
           most rooms and it absolutely stunning. You can transform a room in
           seconds with this lighting.
       8. Doors... £200
           Made from quality solid oak, these doors are perfect for making
           the room feel complete.
       9. Laundry machine... £400
           Powerful washing machine and tumble drier combination, perfect for
           any busy household. Quick and reliable, your new best friend!
       10. Water detector... £700
           Detect the presence of water to provide an alert in time to prevent
           a serious water leak.
       11. Monitoring system... £100
           The perfect start-up CCTV kit for any home. This budget item is great
           if you just want that extra protection and monitoring whilst you're
           away from your home."
           puts "__________________________________________"
           puts "Press any key to go back to main menu."
            list_of_tech = gets.chomp
            if list_of_tech 
                mainscreen 
            end

    end

end



