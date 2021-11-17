#! /usr/bin/ruby

#examples from pickaxe
#page 34


class BookInStock

    attr_reader :isbn, :price

    def initialize(isbn, price)
        @isbn = isbn
        #terminating the program with an error if that conversion fails
        @price = Float(price)
    end

    #overriding the default to_s method
    def to_s
        "ISBN: #{@isbn}, PRICE: #{@price}"
    end


    #accessor methods to get private instance var's value 
    #more convient way, because this is a common idiom is to use attr_reader
    # def isbn
    #     @isbn
    # end

    # def price
    #     @price
    # end


end

b1 = BookInStock.new("isbn1", 3.2)
b2 = BookInStock.new("isbn2", 4)
b3 = BookInStock.new("isbn3","5.67")

p b1
p b2
p b3

puts b1
puts b2
puts b3

puts b1.price


