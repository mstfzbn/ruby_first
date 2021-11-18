#! /usr/bin/ruby

#require 'some_build_in_lib'
#require_relative 'another_ruby_source_file_in_same_directory'

#examples from pickaxe

class BookInStock

    #works like a getter
    attr_reader :isbn
    #accessor can read and write, like setter and getter
    attr_accessor :price

    #sets up an environment for your object, leaving it in a usable state
    def initialize( isbn, price )
        @isbn = isbn
        #terminating the program with an error if that conversion fails
        @price = Float( price )
    end

    #overriding the default to_s method
    def to_s
        "ISBN: #{@isbn}, PRICE: #{@price}"
    end


    #this shielding is called Uniform Access Principle
    #virtual attribute, internaly, no coresponds with an instance variable
    def price_in_cents
        Integer( price*100 + 0.5 )
    end

    
    def price_in_cents=( cents ) 
        @price = cents/100.0
    end


    #attribute setters
    # def isbn=(new_isbn)
    #     @isbn = new_isbn
    # end
    
    # def price=(new_price)
    #     @price = new_price
    # end


    #accessor methods to get private instance var's value 
    #more convient way, because this is a common idiom is to use attr_reader
    # def isbn
    #     @isbn
    # end

    # def price
    #     @price
    # end

    #default Access Control is public
    #like C++, its subsequent methods inherits setted method
    #initialize is always private

    public
    def method1
        #
    end

    def method2
        #
    end

    protected
    def method3
        #
    end

    private
    def method4
        #
    end

    #and etc

    #another way is to list them at the end of class declaration
    # public    :method1, :method2
    # protected :method3
    # private   :method4

end

class Account
    attr_accessor :balance
    def initialize( balance )
        @balance = balance
    end
end

class Transaction
    def initialize( account_a, account_b )
        @account_a = account_a
        @account_b = account_b
    end

  private
    
    def debit( account, amount )
        account.balance -= amount
    end

    def credit( account, amount )
        account.balance += amount
    end

  public

    def transfer(amount)
        debit( @account_a, amount )
        credit( @account_b, amount )
    end

end

savings = Account.new( 100 )
chekings = Account.new( 200 )

transaction = Transaction.new( chekings, savings )
transaction.transfer(50)

puts savings.balance
puts chekings.balance


#example of protected class variable usgae from object in same type
# class Account
#     attr_reader :cleared_balance
#     protected   :cleared_balance

#     def greater_balance_than?( other ) #other is the same Account type
#         @cleared_balance > other.cleared_balance
#     end
    
# end


b1 = BookInStock.new("isbn1", 3.2)
b2 = BookInStock.new("isbn2", 4)
b3 = BookInStock.new("isbn3","5.67")

p b1
p b2
p b3

b1.price *= 0.75

puts b1
puts b2
puts b3

puts b1.price
puts b1.isbn


b1.price_in_cents = 6700

puts b1.price_in_cents




