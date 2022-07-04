class Customer < ActiveRecord::Base
    has_many :orders
    has_many :coffees, through: :orders

    # Customer#orders: returns a collection of all Order instances for this customer (class method -> if customer = Customer.last, customer.orders works bc of has_many macros)

    # Customer#coffees: returns a collection of all Coffee instances for this customer (class method -> if customer = Customer.last, customer.coffees already able to do this bc of has_many macros)

    # Customer.names: class method that returns a collection with all of the customer names
    def self.names
        all.map{|customer| customer.name} #all refers to all instances of customers
    end
    # another way:
        # pluck(:name) will return ["Ms. Dewayne Ankunding", "Cassy Johns" "Caitlin Price", "Carlos Strosin", "The Hon. Malik Wunsch", "Lizabeth Goodwin", "Raphael Nikolaus DO", "Daniella Wisoky", "Rusty Hermiston","Jonathon Frami"]

    # Customer#order_coffee(coffee_title, price): instance method that takes in a coffee title and price and will create an order with that coffee and price
    # should put out the order receipt
    def order_coffee(coffee_title, price)
        # find coffee_id using coffee title
        coffee = Coffee.find_by(title: coffee_title)
        # create a new instance of Order
            # self refers to the customer that this method is called on
            # price gets the price from argument
            # coffee is the coffee instance that is found using the find_by method and coffee title
        Order.create(customer: self, price: price, coffee: coffee).receipt
    end

    # Customer#total_purchases_amount: instance method that returns the cost of all of the Customer's coffee orders
    # customer = Customer.first (set first customer to a variable)
    # customer.orders (returns all that customer's order instances)
    # need to map through these orders to find price
        # customer.orders.pluck(:price) will give me [5, 2, 3, 2, 1, 4, 3, 2]
    # then sum up the price to get a total (use .sum on price array)
        # customer.orders.pluck(:price).sum
    def total_purchases_amount
        self.orders.pluck(:price).sum
    end

    # Customer#dislike_coffee(coffee_title): instance method that takes in a coffee_title, finds the last order for that coffee and removes it.
    # puts a message formatted like: {customer name} has been refunded ${price}

    # customer = Customer.first (set first customer to a variable)
    # find the coffee by the coffee title
        # coffee = Coffee.find_by(title: coffee_title)
    # within the customer's order, find the last instance of that coffee??
        # order = customer.orders.find_by(coffee_id: coffee.id)
    # removes it
        # order.destroy
    # puts message: puts "#{name} has been refunded $#{order.price}"
end