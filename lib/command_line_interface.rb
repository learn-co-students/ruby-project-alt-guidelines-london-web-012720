class CommandLineInterface

    def greet
        puts "________________"
        puts "Welcome to Tech Hunter"
        puts "________________"
    end

    def menu
        puts "________________"
        puts "Insert the user name to continue:"
        @user_name     = gets.chomp
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
        Where would you like to go?
        1. Order history
        2. Create a new order
        3. Update your order 
        4. Cancel your order
        5. Go back to the login page
        "
        puts "____________________________________________"
        
        mainscreen_options = gets.chomp.to_i
        case mainscreen_options 

        when  1
            order_history       
        when 2
            insert_budget
        when  3
            delete_user_order
        when 4
            puts "num4"
            menu
        when 5
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
            if @all_products.size <= 0
                puts "empty"
                mainscreen
            end

             @all_products.map do |p|
             puts "You have ordered a #{p.product_type}, for £#{p.product_price}."
             puts""
             
            end

    end

    def insert_budget
        puts "insert budget"
        puts "__________________________________________ "

        user_budget     = gets.chomp.to_i
        @product_budget = Product.all.select {|p|p.product_price <= user_budget}
        puts "Yout budget allow you to buy:"

        puts "____________________________________________"

            @product_budget.each_with_index do |p, i|
        puts "#{i +=1}\t #{p.product_type}, which cost #{p.product_price} product ID #{p.id}"
        puts "______________________________________________________"
        end
        create_product 
    end

    def create_product
        puts "__________________________________________"
        puts"Select the ID of your chosen product"
        puts""
        user_choice = gets.chomp.to_i
        p           = Product.find_by(id: user_choice)
        new_order   = Order.new(user_id: @user_instance.id, product_id: p.id, date: 2020).save

        puts""
        puts "You have bought selected #{p.product_type} which cost #{p.product_price}"
        puts ""
        puts "__________________________________________"
        mainscreen
    end


    def delete_user_order
        puts "---------------------------------------------------------------------------------"
        puts "Please enter your order to update"
            @all_products.find do |p|
                @all_orders.each do |o|
                    puts "In your card there is #{p.product_type} with a order id #{o.id}"
                end
            end
        @all_orders.all.find_by(id: gets.chomp.to_i).delete
        @all_products

        puts "order deleted"
       
            mainscreen
    end

end


