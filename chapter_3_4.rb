#! /usr/bin/ruby

#about variables

#every var is a reference to an object, stored somwhere in a heap memory

person = 'Jack'

puts "person's type is a #{person.class}"
puts "person's object id is #{person.object_id}"
puts "person's value is #{person}"

person1 = 'Tim'
person2 = person1

person1[0] = 'J'

#strings are mutable
#both person1 and person2 hold a reference to a same object

puts person1
puts person2

#.dup method creates a new object, not aliases to an old one
person3 = person2.dup

person2[0] = 'K'

puts person2
puts person3

person2.freeze #it will convert it to non mutable and will throw an exeption if there is a modification attempt like "person2[0] = 'M'"



