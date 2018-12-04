#!/usr/bin/env ruby

a = []

0.upto 1000 { |y| a[y] = Array.new(1000, 0) }

File.readlines(ARGV[0]).each do |line|
  tokens = line.split ' '
  positions = tokens[2].split(',').map { |e| e.to_i }
  sizes = tokens[3].split('x').map { |e| e.to_i }
  
  sizes[1].times { |y| sizes[0].times { |x| a[positions[1] + y][positions[0] + x] += 1 } }
end

puts a.flatten.select { |e| e > 1 }.count
