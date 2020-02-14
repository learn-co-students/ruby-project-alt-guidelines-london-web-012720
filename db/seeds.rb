u1 = User.create(user_name: "Mustafa")
u2 = User.create(user_name: "Sergio")
u3  = User.create(user_name: "Lili")

p1 = Product.create(product_type: "Smart TV", product_price: 200)
p2 = Product.create(product_type: "Wireless Speaker System", product_price: 100)
p3 = Product.create(product_type: "Thermostat", product_price: 300)
p4 = Product.create(product_type: "Home Security", product_price: 400)
p5 = Product.create(product_type: "Domestic", product_price: 500)
p6 = Product.create(product_type: "Smoke/CO Detector", product_price: 800)
p7 = Product.create(product_type: "Lighting", product_price: 300)
p8 = Product.create(product_type: "Door", product_price: 200)
p9 = Product.create(product_type: "Laundry Machine", product_price: 400)
p10 = Product.create(product_type: "Water Detector", product_price: 700)
p11  = Product.create(product_type: "Monitoring System", product_price: 100)

Order.create(user_id: u3.id, product_id: p1.id, date: 2013)
Order.create(user_id: u2.id, product_id: p2.id, date: 2014)
Order.create(user_id: u3.id, product_id: p4.id, date: 2013)
Order.create(user_id: u1.id, product_id: p2.id, date: 2013)
Order.create(user_id: u2.id, product_id: p7.id, date: 2015)
Order.create(user_id: u1.id, product_id: p10.id, date: 2015)
Order.create(user_id: u1.id, product_id: p6.id, date: 2016)
Order.create(user_id: u2.id, product_id: p5.id, date: 2017)
Order.create(user_id: u3.id, product_id: p3.id, date: 2019)
Order.create(user_id: u3.id, product_id: p4.id, date: 2019)
Order.create(user_id: u1.id, product_id: p2.id, date: 2018)
Order.create(user_id: u3.id, product_id: p1.id, date: 2016)




