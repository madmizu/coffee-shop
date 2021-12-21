class Coffee < ActiveRecord::Base
    has_many :orders
    has_many :customers, through: :orders

    def unique_customer_names
        customers.distinct.pluck(:name)
    end

    def self.most_ordered
        binding.pry
        # Order.distinct.count("coffee_id")
        # orders.pluck(price).sum
        # self.all.max_by {|coffee| coffee.orders.count}

        Coffee.all.includes(:orders).max_by {|coffee| coffee.orders.length}

        #to check:
        # Coffee.first.orders.count
    end
end
  