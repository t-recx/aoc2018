#!/usr/bin/env ruby

a = []

1000.times { |y| a[y] = Array.new(1000, 0) }

File.readlines(ARGV[0]).each do |line|
  tokens = line.split ' '
  x, y = tokens[2].split(',').map { |e| e.to_i }
  w, h = tokens[3].split('x').map { |e| e.to_i }
  
  h.times { |iy| w.times { |ix| a[y + iy][x + ix] += 1 } }
end

puts a.flatten.count { |e| e > 1 }
