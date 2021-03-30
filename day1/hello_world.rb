#!/usr/bin/ruby
# -*- coding: UTF-8 -*-

s = " Hello, world. "
puts "#{s}"

puts "#{s.include?('world')}"
puts "#{s =~ /world/i}"

(1..10).each do |d|
    puts " This is sentence number #{d}. "
    puts "#{s}"
end
