#!/usr/bin/ruby
# -*- coding: UTF-8 -*-

puts "Guess what it is: (0-9)"

s = gets
r = rand(10)

result = case s.to_i
when 0...r
    "Too small"
when r..r
    "Correct"
else
    "Too large"
end

puts result
puts "That's #{r}"
