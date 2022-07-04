class Order < ActiveRecord::Base
    belongs_to :coffee
    belongs_to :customer

    # Order#customer: return the Customer instance for this order (class method) => you can already do .customer on an instance of this class bc of the belongs_to macro!!
    # def self.customer
    #     customer
    # end


    # Order#coffee: return the Coffee instance for this order (also a class method) => you can already do .coffee on an instance of this class bc of the belongs_to macro!!
    # def self.coffee
    #     coffee
    # end

    # Order#receipt: instance method. puts a message formatted like: {customer name} ordered a {coffee title} for ${price}
    def receipt
        puts "#{customer.name} ordered a #{coffee.title} for $#{price}"
    end

end