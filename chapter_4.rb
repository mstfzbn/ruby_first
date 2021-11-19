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

#for cycle example
for i in 0...8
    #something
end


#chek again page 49
#check this string.downcase.scan( for_something ) two functions together
def words_from_string(string)
    string.downcase.scan(/[\w']+/)
end

def count_frequency(word_list)
    counts = Hash.new(0)

    for word in word_list
      counts[word] += 1
    end

    counts
end

raw_text = %{The problem breaks down into two parts. First, given some text
    as a string, return a list of words. That sounds like an array. Then, build
    a count for each distinct word. That sounds like a use for a hash---we can
    index it with the word and use the corresponding entry to keep a count.}
   
word_list = words_from_string(raw_text)
counts = count_frequency(word_list)
sorted = counts.sort_by {|word, count| count}
top_five = sorted.last(5)

for i in 0...5              # (this is ugly code--read on
   word = top_five[i][0]    # for a better version)
   count = top_five[i][1]
   puts "#{word}: #{count}"
end