#! /usr/bin/ruby

#examples from pickaxe

# some conventions
# Local Variable: name fish_and_chips x_axis thx1138 _x _26
# Instance Variable: @name @point_1 @X @_ @plan9
# Class Variable: @@total @@symtab @@N @@x_pos @@SINGLE
# Global Variable: $debug $CUSTOMER $_ $plan9 $Global
# Class Name: String ActiveRecord MyClass
# Constant Name: FEET_PER_MILE DEBUG

PI = 3.141592

class SampleEcho
  def some_echo	
    puts "hello,ruby world"
  end
end

some_t_obj = SampleEcho.new

some_t_obj.some_echo

def sum( first,second )
  first + second
end

strange_sum = sum('cat','dog')

puts strange_sum 

#expresion interpolation, can be var passed by method argument
puts "It's now #{Time.now}"

puts "some ruby string".length
puts "another string".index("s")
puts 42.even?

def say_good_night(name)
  "Good night, #{name.capitalize}"
end

puts say_good_night('musti')


#arrays
arr = [1, 'asl', 3.14]

puts "The first element is #{arr[0]}"
puts "The whole array is #{arr.inspect}"


#some technique to use strings in arrays

str_arr = %w{ cat dog mouse }

puts "array with animals #{str_arr.inspect}"

#hashes

numbers_hash = {
  1 => 'one',
  2 => 'two',
  3 => 'three',
  4 => 'four'
}

p numbers_hash.inspect

#constants using
p "Pythagoras constant #{PI}"
#constant to symbol 
p "Pythagoras constant #{:pi}"

#a hash with symbols style
music_instruments_hash = {

  cello: 'strings',
  clarinet: 'woodwing',
  drum: 'percussion'
}

p "Music instruments first elements type is type: #{music_instruments_hash[:cello]}"

music_instruments_hash.each { |key, value| puts "key: #{key}, value: #{value}" } 

#control structures

today = Time.now

if today.saturday? || today.sunday?
  puts "rest"
else
  puts "go to work"
end

#nil is false when its used in conditional statements

counter = 0

while counter < 3
  p "iterations #{counter}"
  counter += 1
end

puts "the #{:PI} is #{PI}" if PI < 4

acumulating_number = 2
acumulating_number = acumulating_number**2 while acumulating_number < 1000

p acumulating_number


#basic Regex

# /\d\d:\d\d:\d\d/ # a time such as 12:34:56
# /Perl.*Python/ # Perl, zero or more other chars, then Python
# /Perl Python/ # Perl, a space, and Python
# /Perl *Python/ # Perl, zero or more spaces, and Python
# /Perl +Python/ # Perl, one or more spaces, and Python
# /Perl\s+Python/ # Perl, whitespace characters, then Python
# /Ruby (Perl|Python)/ # Ruby, a space, and either Perl or Python

test_string_for_regex = 'Some of scrypting languages are Ruby and Perl.'

#test regex
if test_string_for_regex =~ /Ruby .*Perl/
  p 'there is a scrypting lang'
end