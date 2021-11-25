#! /usr/bin/ruby
#Standard types

newLine = -> { printf"\n" }



newLine.call

p Rational(3,4) * Rational(2,3)

newLine.call

p Complex(1,2) * Complex(3,4)



3.times { "something" }

1.upto(5) { |i| printf("%d ", i)  }
newLine.call

95.downto(90) { |i| printf("%d ", i) }

newLine.call
# start. end, step
50.step(80,5) { |i| printf("%d ", i) }
newLine.call

#some ranges to array and enumerator
p (1..10).to_a

enum_chars = ('a'...'d').to_enum

#works
enum_chars.each { puts " #{enum_chars.next} "}


#ranges as conditions
if (1..10) === 5 
    p 'true'
end





