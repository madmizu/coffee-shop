class Customer < ActiveRecord::Base
    attr_reader :name
    has_many :orders
    has_many :coffees, through: :orders

    def self.names
        all.map { |c| c[:name] }
    end

    # def order_coffee(coffee_title, price)
    #     drink = Coffee.all.find { |c| c.title = coffee_title }
    #     # Order.create(price: price, customer_id:self.id , coffee_id:drink.id)
    #     binding.pry
    # end

    def total_purchases_amount
        orders.map{|o| o.price}.sum
    end

    def dislike_coffee(coffee_title)
        binding.pry
        # Customer.first.coffees.find{|c| c.title == coffee_title}
    end
end