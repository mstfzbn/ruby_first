#! /usr/bin/ruby

#blocks and iterators

for i in 0...5
    # do something
end

hash_with_words = {
    one: "first",
    two: "second",
    three: "third",
    fourth: "four"
}

#different ways to show hash's values with blocks
#each.with_index method return the elemnts index
hash_with_words.each do |count, position|
    puts "  #{count} : #{position} " 
end

puts hash_with_words.map { |count, position| "#{count} : #{position}" }

def two_times
    yield
    yield
end

two_times { puts "hello, ruby" }



def fib_up_to(max)
    
    i1, i2 = 1, 1 # parallel assignment (i1 = 1 and i2 = 1)
    
    while i1 <= max
        yield i1
        i1, i2 = i2, i1+i2 #check this line
    end
end


fib_up_to(1000) {|f| print f, " " }


printf("\n") #works ;)

puts [1,3,5,7].inject(0) { |sum, element| sum + element }
puts [1,3,5,7].inject(1) { |product, element| product * element }

[1,3,5,7].inject(:+) # => 16
[1,3,5,7].inject(:*) # => 105



#enumerators

a = [1, 3, "cat"]
h = { dog: "caine", fox: "vulpine" }

#creating Enumerators
enum_a = a.to_enum
enum_h = h.to_enum

enum_a_2 = a.each

#loop know how much element will be iterated
loop do
    puts "#{enum_a.next} : #{enum_a_2.next}"
end


short_enum = [1,2,3].to_enum
#be carefull for different types of parenthesis ('a'..'z') != ['a'..'z']
long_enum = ('a'..'z').to_enum

#loop will ends on shortest iterator
loop do 
    puts "#{short_enum.next} - #{long_enum.next}"
end


#chained methods again
result = []
"cat".each_char.each_with_index {|item, index| result << [item, index]}

p result

#enumerators are Generators and Filters page 59

#enumerator, that generates an infinity sequence
triangular_numbers = Enumerator.new do |yielder|
    number = 0
    count = 1
    loop do
        number += count
        count += 1
        yielder.yield number
    end
end

5.times { print triangular_numbers.next, " "}


def infinitie_select(enum, &block) #check is it the same referention like in c++
    Enumerator.new do |yielder|
        enum.each do |value|
            yielder.yield(value) if block.call(value)
        end
    end
end

printf("\n")

p infinitie_select(triangular_numbers) {|val| val%10 == 0}.first(5)


#implementing a function directly in the Enumerator class
#working like "filters"
class Enumerator
    def infinitie_select( &block )
    Enumerator.new do |yielder|
        self.each do |value|
            yielder.yield(value) if block.call(value) #check call function
            end
        end
    end
end

p triangular_numbers.infinitie_select {|val| val%10 == 0 }.infinitie_select {|val| val.to_s =~ /3/}.first(5) # =~ is for regex



#Lazy enumerators page 62


#check this thing... IMPORTANT Lazy is supported in Ruby 2.0+
def Integer.all
    Enumerator.new do |yielder, n: 0| # n: 0 is a declaration and an initialization of a local variable
        loop { yielder.yield(n += 1) }
    end#.lazy #.lazy converts a basic generator to lazy enumerator in Ruby 1.9
end

p Integer.all.first(10)


class File
    def self.open_and_process(*args) #it's a class method, 
        f = File.open(*args)         #collect the actual parameters passed to the method into an array named args
        yield f
        f.close()
    end
end


class File
    def self.my_open(*args)
        result = file = File.new(*args)
        #if there's a block , pass in the file and close the file when it returns
        if block_given?
            result = yiled file
            file.close
        end
        result
    end
end

#still, there is no error handling




#Blocks Can Be Objects page 64
# & as a prefix for last parameter in method definition
# in that function, the block will be converted to class Proc object

class ProcExample
    def pass_in_block( &action )
        @stored_proc = action
    end

    def use_proc( parameter )
        @stored_proc.call( parameter )
    end

end

eg = ProcExample.new
eg.pass_in_block { |param| puts "The parameter is #{param}" }
eg.use_proc(99)  #black be used later

def create_block_object( &block )
    block
end

bo = create_block_object { |param| puts "You called me with #{param}" }

bo.call 99
bo.call "cat"

bo_2 = lambda { |param| puts "You called me with #{param} as lamda." }
bo_2.call 199
bo_2.call "lambda"


#closure
def n_times(thing)
    lambda { |n| puts thing * n }
end

p1 = n_times(23)
p1.call(3)
p1.call(4)
p2 = n_times("Hello ")
p2.call(3)



def power_proc_generator
    value = 1
    lambda { value += value }
end


power_proc = power_proc_generator

puts power_proc.call
puts power_proc.call
puts power_proc.call

#another way to create a ruby object
#-> params { ... }

proc1 = -> arg { puts "In proc1 with #{arg}" }
#parentheses are optional
proc2 = -> (arg1, arg2) { puts "In proc2 with #{arg1} and #{arg2}" }

proc1.call "ant"
proc2.call "cat", "dog"

def my_if( condition, then_clause, else_clause )
    if condition
        then_clause.call
    else
        else_clause.call
    end
end

5.times do |val| 
    my_if val < 2, #condition
            -> { puts "#{val} is small" }, #then clause
            -> { puts "#{val} is big" } #else clause
end



def my_while( cond, &body )
    while cond.call
        body.call
    end
end

a = 0

my_while -> { a < 3 } do
    puts a 
    a += 1
end

proc2 = -> a, *b, &block do 
    puts "a = #{a.inspect}"
    puts "b = #{b.inspect}"
    block.call #need to call given block
end

proc2.call(1, 2, 3, 4) { puts "in proc2 block"}

#end of chapter 4.3 page 68

