#! /usr/bin/ruby
#Sharing functionality: Inheritance, modules and mixins

print_a_new_line = -> { print"\n"}

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
    extend GravityConstant

    #attr_accessor :sur_name #check how to manage more members in derivated class

    def initialize(sur_name)
        #super #check how to extend a parent class constructor
        #@sur_name = sur_name
    end

    def make_a_calculation
        super #uses parent's class method definition with it's arguments
    end
end


par = Parent.new("Jack")
chi = Child.new("Jim")

par.say_hello
chi.say_hello

print_a_new_line.call

par.show_constant
chi.show_constant


# * try to pass some elements, array with numbers, splat parameters.. some exercises.. *array element by elemnt.. 
#common interfaces functions
# ** to an argument in function parameters list
#try catch block
#exeptions! .. 

print_a_new_line.call

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
 



module Debug
    def who_am_i
        "Class name: #{self.class.name}, (id: #{self.object_id}) ; self.name: #{self.name}"
    end
end

class Phonograph
    
    include Debug #included a custom module
    include Comparable #included a standard module  check - perhaps includes more than <=>, also map, find_all and etc

    include Enumerable #to test include?, map, find_all

    attr_reader :name
 
    def initialize(name)
        @name = name
    end

    def to_s
        "#{@name}"
    end

    def <=>(rhs) #adds min, max, sort abilities to Phonograph class
        self.name <=> rhs.name
    end

    def +(rhs)
        self.name + ", " +rhs.name
    end
    
end

#check page 76 about modules including mechanism

ph_1 = Phonograph.new("West-East")
ph_2 = Phonograph.new("North-South")
ph_3 = Phonograph.new("Another direction")

print_a_new_line.call

puts ph_1.who_am_i

if ph_1 > ph_2
    p "1 > 2"
else
    p "1 < 2"
end

print_a_new_line.call

#soring will automaticly works for custom clases, makes them Comparable, when they includes Comparable module
a = [ph_1, ph_2, ph_3].sort 


puts a

print_a_new_line.call
puts a.max #min

print_a_new_line.call
a.find_all { |obj| obj =~ /^West/ }

#include module Enumerable in MyCustomClass, to have access to find_all, include?, map


#included modules gives it's abilities to instances from targeted class, new instance methods
#extended modules makes their methods class methods to ratgeted class

# a.inject(:+)

print_a_new_line.call
p ph_1 + ph_2

print_a_new_line.call

p print_a_new_line.class #it's a proc type object ;)