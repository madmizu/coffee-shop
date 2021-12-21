class Order < ActiveRecord::Base
    belongs_to :customer
    belongs_to :coffee
    
    def receipt
        p "#{customer.name} ordered a #{coffee.title} for $#{price}"
    end
end