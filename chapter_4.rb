#! /usr/bin/ruby

#page 49

#containers, blocks and iterators

#arrays
a_mix = [ 3.141592, 'PI', 5]

p a_mix
puts a_mix.class
puts a_mix.length

#a[-1] is the index of last element

a = [ 1, 3, 5, 7, 9 ]
p a

puts "first 4: #{a.first(4)}"
puts "last 2: #{a.last(2)}"

#indexing an array with a pair of numbers [START, COUNT]

puts "start:count [1,3] - #{a[1,3]}"
puts "start:count [4,1] - #{a[4,1]}"
puts "start:count [2,2] - #{a[2,2]}"

#indexing an array with a ranges, represents start and end positions - two dots includes the last index, three dots - don't

puts "range [1..3] - #{a[1..3]}"
puts "range [1...3] - #{a[1...3]}"
puts "range [3..3] - #{a[3..3]}"

#arrays have a large set of methods, using them, we can interpret arrays like sets, queues, stacks, dequeues and FIFO queues

stack = []
stack.push 'red'
stack.push 'green'
stack.push 'blue'

p stack

stack.pop
stack.pop
stack.pop

p stack

#hashes
#they can use any type of objects as index and remembers the adding order
h = { 'dog' => 'caine', 'cat' => 'feline', 'donkey' => 'asinine' } 

h['cow']  = 'bovine'

#h = { :dog => 'canine', :cat => 'feline', :donkey => 'asinine' } | keys as symbols from ruby 1.9
#perhaps deserible format is
#h = { dog: 'canine', cat: 'feline', donkey: 'asinine' } | literal, writed by colons at the and of key symbol and dropped => 


#chek again page 49
#check this string.downcase.scan( for_something ) two functions together
def words_from_string(string)
    string.downcase.scan(/[\w']+/)
end

#for cycle example

for i in 0...8
    p i
end
