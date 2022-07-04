class Coffee < ActiveRecord::Base
    has_many :orders
    has_many :customers, through: :orders

    # Coffee#orders: returns a collection of all Order instances for this coffee (if coffee = Customer.first, then coffee.orders return all order instances of this coffee thanks to the has_many macro!)

    # Coffee#customers: returns a collection of all Customer instances who ordered this coffee (if coffee = Customer.first, then coffee.customers return all customers instances of this coffee thanks to the has_many macro!)

    # Coffee#unique_customer_names: returns an array with all of the customers names who have ordered the coffee
    def unique_customer_names
        self.customers.map{|customer| customer.name}
    end

    # Coffee.most_ordered: returns the Coffee instance that was ordered the most
    
end