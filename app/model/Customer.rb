class Customer < ActiveRecord::Base
    attr_reader :name
    has_many :orders
    has_many :coffees, through: :orders

    def self.names
        pluck(:name)
    end

    def order_coffee(coffee_title, price)
        drink = Coffee.find_by { title = coffee_title }
        new_order = Order.create(price: price, customer_id:self.id , coffee_id:drink.id)
        new_order.receipt
    end

    def total_purchases_amount
        # orders.pluck(price).sum
            #uses both activerecord (pluck) and ruby (sum) methods
        orders.sum(:price)
            #uses only activerecord
    end

    def dislike_coffee(coffee_title)
        coffee = Coffee.find_by(title: coffee_title)
        # Customer.first.coffees.find{|c| c.title == coffee_title}
        order.where("coffee_id = ?", coffee.id).last
        p "#{name} has been refunded $#{order.price}"
    end
end