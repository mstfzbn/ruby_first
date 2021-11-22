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