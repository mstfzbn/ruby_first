
class Coffee
    attr_accessor :price, :milk

    def initialize
        @price = 1
    end

    def add( milk )
       
        @milk = milk
        @price = 1.25
    end

    def have_a_milk
        @milk != nil            
    end

end