

u1 = User.create(user_name: "Mustafa")
u2 = User.create(user_name: "Sergio")
u3 = User.create(user_name: "Lilly")


p1 = Product.create(product_type: "Smart Tv", product_price: 200)
p2 = Product.create(product_type: "Wireless speaker systems", product_price: 100)
p3 = Product.create(product_type: "Thermostats", product_price: 300)
p4 = Product.create(product_type: "Home security", product_price: 400)
p5 = Product.create(product_type: "Domestic", product_price: 500)
p6 = Product.create(product_type: "Smoke/CO", product_price: 800)
p7 = Product.create(product_type: "Lighting", product_price: 300)
p8 = Product.create(product_type: "Door", product_price: 200)
p9 = Product.create(product_type: "Laundry machines", product_price: 400)
p10 = Product.create(product_type: "Water detectors", product_price: 700)
p11 = Product.create(product_type: "Monitoring systems", product_price: 100)


o1 = Order.create(user_id: u2.id, product_id: p9.id, date: 2020)
o2 = Order.create(user_id: u1.id, product_id: p2.id, date: 2020) 

