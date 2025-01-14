class ShoppingCart
    attr_reader :name, :capacity, :products
    def initialize(store, capacity)
        @name = store
        @capacity = capacity.to_i
        @products = []
    end

    def add_product(product)
        @products << product
    end

    def details
        details = {
            name: @name,
            capacity: @capacity
        }
    end

    def total_number_of_products
        total_number_of_products = 0
        @products.each do |product|
            total_number_of_products += product.quantity
        end
        total_number_of_products
    end

    def is_full?
        if total_number_of_products >= @capacity
            true
        else
            false
        end
    end

    def products_by_category(category)
        products.find_all do |product|
            product.category == category
        end
    end

    def percentage_occupied
        ((total_number_of_products.to_f / @capacity) * 100).round(2)
    end

    def sorted_products_by_quantity
        sorted_wrong = products.sort_by do |product|
            product.quantity
        end
        sorted_wrong.reverse
    end

    def product_breakdown
        # require 'pry'; binding.pry
        @products.to_h {|product| [product.category, product]}
    end
end