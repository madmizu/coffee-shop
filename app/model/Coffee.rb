class Coffee < ActiveRecord::Base
    has_many :orders
    has_many :customers, through: :orders

    def unique_customer_names
        self.customers.map{|c| c[:name]}
    end

    def self.most_ordered
        binding.pry
        
    end
end
  