#! /usr/bin/ruby
#Sharing functionality: Inheritance, modules and mixins

module MathConstant
    PI = 3.141592

    def self.show_constant
        puts "#{:PI} : #{PI}"
    end

    def show_constant
        puts "#{:PI} : #{PI}"
    end
end

module GravityConstant
    G = 9.8

    def self.show_constant
        puts "#{:G} : #{G}"
    end

    def show_constant
        puts "#{:G} : #{G}"
    end
end

class Parent
    include MathConstant
    
    attr_accessor :name
    
    def initialize(name)
        @name = name
    end
    
    #overriding default to_s method
    def to_s
        puts "Parent's name #{@name}"
    end

    def say_hello
        puts "Hello, from #{self}"        
    end

    def self.make_a_calculation( some_number )
        some_number * 4
    end

end

class Child < Parent
    include GravityConstant

    #attr_accessor :sur_name #check how to manage more members in derivated class

    def initialize(sur_name)
        #super #check how to extend a parent class constructor
        #@sur_name = sur_name
    end

    def make_a_calculation
        super
    end
end

par = Parent.new("Jack")
chi = Child.new("Jim")

par.say_hello
chi.say_hello

par.show_constant
chi.show_constant


# * try to pass some elements, array with numbers, splat parameters.. some exercises.. *array element by elemnt.. 
#common interfaces functions
# ** to an argument in function parameters list
#try catch block
#exeptions! .. 


#include and exted in methods

#ancestors chain 
p Child.superclass
p Parent.superclass
p Object.superclass
p BasicObject.superclass

p Parent.make_a_calculation(20)
p Child.make_a_calculation(2)

p Child.ancestors
p Parent.ancestors

p MathConstant.show_constant
 



